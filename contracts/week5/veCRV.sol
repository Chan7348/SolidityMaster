// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { ISmartWalletChecker } from "./interface/ISmartWalletChecker.sol";
import { ICRV } from "./interface/ICRV.sol";

interface IveCRV {
    event CommitOwnership(address admin);
    event ApplyOwnership(address admin);
    event Deposit(address indexed provider, uint value, uint indexed locktime, int128 typee, uint timestamp);
    event Withdraw(address indexed provider, uint value, uint timestamp);
    event Supply(uint prevSupply, uint supply);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function commitTransferOwnership(address _addr) external;
    function applyTransferOwnership() external;
    function commitSmartWalletChecker(address _addr) external;
    function applySmartWalletChecker() external;
    function getLastUserSlope(address _addr) external view returns (int128);
    function userPointHistoryTimestamp(address _addr, uint _idx) external view returns (uint);
    function lockedEnd(address _addr) external view returns (uint);

    function checkPoint() external;
    function depositFor(address _addr, uint _value) external;
    function createLock(uint _value, uint _unlockTime) external;
    function increaseAmount(uint _value) external;
    function increaseUnlockTime(uint _unlockTime) external;
    function withdraw() external;

    function balanceOf(address _addr) external view returns (uint);
    function balanceOf(address _addr, uint _timestamp) external view returns (uint);
    function balanceOfAt(address _addr, uint _block) external view returns (uint);
    function totalSupply() external view returns (uint);
    function totalSupply(uint _t) external view returns (uint);
    function totalSupplyAt(uint _block) external view returns (uint);
    function changeController(address _newController) external;
}


contract veCRV is IveCRV {
    struct Point {
        int128 bias;
        int128 slope; // - dweight / dt
        uint timestamp;
        uint blockNumber;
    }
    struct LockedBalance {
        int128 amount;
        uint end;
    }
    // 四种储蓄更新类型
    int128 constant DEPOSIT_FOR_TYPE = 0;
    int128 constant CREATE_LOCK_TYPE = 1;
    int128 constant INCREASE_LOCK_AMOUNT = 2;
    int128 constant INCREASE_UNLOCK_TIME = 3;
    uint constant MAXTIME = 4 * 365 days;
    uint constant MULTIPLIER = 10 ** 18;
    address public token;
    uint public supply; // CRV token的总供应量
    mapping(address => LockedBalance) public locked; // 记录每个地址锁定的金额和锁定到期的时间
    uint public epoch;
    Point[100000000000000000000000000000] public pointHistory;
    mapping(address => Point[1000000000]) public userPointHistory;
    mapping(address => uint) public userPointEpoch;
    mapping(uint => int128) public slopeChanges;
    address public controller;
    bool public transfersEnabled;
    string public name;
    string public symbol;
    string public version;
    uint8 public decimals;
    address public futureSmartWalletChecker;
    address public smartWalletChecker;
    address public admin;
    address public futureAdmin;
    uint private lockUped;
    constructor(address _tokenAddr, string memory _name, string memory _symbol, string memory _version) {
        admin = msg.sender;
        token = _tokenAddr;
        pointHistory[0].blockNumber;
        pointHistory[0].timestamp = block.timestamp;
        controller = msg.sender;
        transfersEnabled = true;
        uint8 _decimals = ICRV(_tokenAddr).decimals();
        require(_decimals <= 255);
        decimals = _decimals;
        name = _name;
        symbol = _symbol;
        version = _version;
    }
    // periphery functions
    function commitTransferOwnership(address _addr) external {
        require(msg.sender == admin);
        futureAdmin = _addr;
        emit CommitOwnership(_addr);
    }
    function applyTransferOwnership() external {
        require(msg.sender == admin);
        address _admin = futureAdmin;
        require(_admin != address(0));
        admin = _admin;
        emit ApplyOwnership(_admin);
    }
    function commitSmartWalletChecker(address _addr) external {
        require(msg.sender == admin);
        futureSmartWalletChecker = _addr;
    }
    function applySmartWalletChecker() external {
        require(msg.sender == admin);
        smartWalletChecker = futureSmartWalletChecker;
    }
    function changeController(address _newController) external {
        require(msg.sender == controller);
        controller = _newController;
    }
    function getLastUserSlope(address _addr) external view returns (int128) {
        uint _uEpoch = userPointEpoch[_addr];
        return userPointHistory[_addr][_uEpoch].slope;
    }
    function userPointHistoryTimestamp(address _addr, uint _idx) external view returns (uint) {
        return userPointHistory[_addr][_idx].timestamp;
    }
    function lockedEnd(address _addr) external view returns (uint) {
        return locked[_addr].end;
    }

    // action functions
    function checkPoint() external {
        LockedBalance memory _old;
        LockedBalance memory _new;
        return _checkPoint(address(0), _old, _new);
    }
    function depositFor(address _addr, uint _value) external lockUp {
        LockedBalance memory _locked = locked[_addr];
        require(_value > 0);
        require(_locked.amount > 0, "No existing lock found");
        require(_locked.end > block.timestamp, "Cannot add to expired lock. Withdraw");
        _depositFor(_addr, _value, 0, locked[_addr], DEPOSIT_FOR_TYPE);
    }
    // 创建新的锁定
    function createLock(uint _value, uint _unlockTime) external lockUp {
        _assertNotContract(msg.sender);// 首先检查合约用户
        _unlockTime = (_unlockTime / 1 weeks) * 1 weeks; // 到期的时间划为整周的倍数以方便计算
        LockedBalance memory _locked = locked[msg.sender]; // 拿到用户的存款账号
        require(_value > 0); // 检查存款金额
        require(_locked.amount == 0, "Withdraw old tokens first"); // 如果已有锁定金额，禁止创建新的锁定
        require(_unlockTime > block.timestamp, "Can only lock until time in the future"); // 检查解锁时间
        require(_unlockTime <= block.timestamp + MAXTIME, "Voting lock can be 4 years max"); // 限制解锁时间长度
        _depositFor(msg.sender, _value, _unlockTime, _locked, CREATE_LOCK_TYPE);
    }
    function increaseAmount(uint _value) external lockUp {
        _assertNotContract(msg.sender);
        LockedBalance memory _locked = locked[msg.sender];
        require(_value > 0);
        require(_locked.amount > 0, "No existing lock found");
        require(_locked.end > block.timestamp, "Cannot add to expired lock. Withdraw");
        _depositFor(msg.sender, _value, 0, _locked, INCREASE_LOCK_AMOUNT);
    }
    function increaseUnlockTime(uint _unlockTime) external lockUp {
        _assertNotContract(msg.sender);
        LockedBalance memory _locked = locked[msg.sender];
        _unlockTime = (_unlockTime / 1 weeks) * 1 weeks;
        require(_locked.end > block.timestamp, "Lock expired");
        require(_locked.amount > 0, "Nothing is locked");
        require(_unlockTime > _locked.end, "Can only increase lock duration");
        require(_unlockTime <= block.timestamp + MAXTIME, "Voting lock can be 4 years max");
        _depositFor(msg.sender, 0, _unlockTime, _locked, INCREASE_UNLOCK_TIME);
    }
    function withdraw() external lockUp {
        LockedBalance memory _locked = locked[msg.sender];
        require(block.timestamp >= _locked.end, "The lock didn't expire");
        uint _value = uint(int(_locked.amount));
        LockedBalance memory _oldLocked = _locked;
        _locked.end = 0;
        _locked.amount = 0;
        locked[msg.sender] = _locked;
        uint _supplyBefore = supply;
        supply = _supplyBefore - _value;
        _checkPoint(msg.sender, _oldLocked, _locked);
        require(ICRV(token).transfer(msg.sender, _value));
        emit Withdraw(msg.sender, _value, block.timestamp);
        emit Supply(_supplyBefore, _supplyBefore - _value);
    }

    // view functions
    function balanceOf(address _addr) external view returns (uint) {
        uint _epoch = userPointEpoch[_addr];
        if (_epoch == 0) return 0;
        else {
            Point memory _lastPoint = userPointHistory[_addr][_epoch];
            _lastPoint.bias -= _lastPoint.slope * int128(int(block.timestamp - _lastPoint.timestamp));
            if (_lastPoint.bias < 0) _lastPoint.bias = 0;
            return uint(int(_lastPoint.bias));
        }
    }
    function balanceOf(address _addr, uint _timestamp) external view returns (uint) {
        uint _epoch = userPointEpoch[_addr];
        if (_epoch == 0) return 0;
        else {
            Point memory _lastPoint = userPointHistory[_addr][_epoch];
            _lastPoint.bias -= _lastPoint.slope * int128(int(_timestamp - _lastPoint.timestamp));
            if (_lastPoint.bias < 0) _lastPoint.bias = 0;
            return uint(int(_lastPoint.bias));
        }
    }
    function balanceOfAt(address _addr, uint _block) external view returns (uint) {
        require(_block <= block.number);
        uint _min = 0;
        uint _max = userPointEpoch[_addr];
        for (uint i=0;i<128;i++) {
            if (_min >= _max) break;
            uint _mid = (_min + _max + 1) / 2;
            if (userPointHistory[_addr][_mid].blockNumber <= _block) _min = _mid;
            else _max = _mid - 1;
        }
        Point memory _uPoint = userPointHistory[_addr][_min];
        uint _maxEpoch = epoch;
        uint _epoch = _findBlockEpoch(_block, _maxEpoch);
        Point memory _point0 = pointHistory[_epoch];
        uint _dBlock = 0;
        uint _dT = 0;
        if (_epoch < _maxEpoch) {
            Point memory _point1 = pointHistory[_epoch + 1];
            _dBlock = _point1.blockNumber - _point0.blockNumber;
            _dT = _point1.timestamp - _point0.timestamp;
        } else {
            _dBlock = block.number - _point0.blockNumber;
            _dT = block.timestamp - _point0.timestamp;
        }
        uint _blockTime = _point0.timestamp;
        if (_dBlock != 0) _blockTime += _dT * (_block - _point0.blockNumber) / _dBlock;
        _uPoint.bias -= _uPoint.slope * int128(int(_blockTime - _uPoint.timestamp));
        if (_uPoint.bias >= 0) return uint(int(_uPoint.bias));
        else return 0;
    }
    function totalSupply() external view returns (uint) {
        uint _epoch = epoch;
        Point memory _lastPoint = pointHistory[_epoch];
        return _supplyAt(_lastPoint, block.timestamp);
    }
    function totalSupply(uint _t) external view returns (uint) {
        uint _epoch = epoch;
        Point memory _lastPoint = pointHistory[_epoch];
        return _supplyAt(_lastPoint, _t);
    }
    function totalSupplyAt(uint _block) external view returns (uint) {
        require(_block <= block.number);
        uint _epoch = epoch;
        uint _targetEpoch = _findBlockEpoch(_block, _epoch);
        Point memory _point = pointHistory[_targetEpoch];
        uint _dT = 0;
        if (_targetEpoch < _epoch) {
            Point memory _pointNext = pointHistory[_targetEpoch + 1];
            if (_point.blockNumber != _pointNext.blockNumber) _dT = (_block - _point.blockNumber) * (_pointNext.timestamp - _point.timestamp) / (_pointNext.blockNumber - _point.blockNumber);
        } else {
            if (_point.blockNumber != block.number) _dT = (_block - _point.blockNumber) * (block.timestamp - _point.timestamp) / (block.number - _point.blockNumber);
        }
        return _supplyAt(_point, _point.timestamp + _dT);
    }
    
    // internal functions
    modifier lockUp {
        require(lockUped ==0);
        lockUped = 1;
        _;
        lockUped = 0;
    }
    function _assertNotContract(address _addr) internal {
        if (_addr != tx.origin) {
            address checker = smartWalletChecker;
            if (checker != address(0)) {
                if (ISmartWalletChecker(checker).check(_addr)) {
                    return;
                }
            }
            revert("veCRV: Smart Contract Deposit Forbidden");
        }
    }
    function _checkPoint(address _addr, LockedBalance memory _oldLocked, LockedBalance memory _newLocked) internal {
        Point memory _uOld;
        Point memory _uNew;
        int128 _oldDslope;
        int128 _newDslope;
        uint _epoch = epoch;
        if (_addr != address(0)) {
            if (_oldLocked.end > block.timestamp && _oldLocked.amount > 0) {
                _uOld.slope = _oldLocked.amount / int128(int(MAXTIME));
                _uOld.bias = _uOld.slope * int128(int(_oldLocked.end - block.timestamp));
            }
            if (_newLocked.end > block.timestamp && _newLocked.amount > 0) {
                _uNew.slope = _newLocked.amount / int128(int(MAXTIME));
                _uNew.bias = _uNew.slope * int128(int(_newLocked.end - block.timestamp));
            }
            _oldDslope = slopeChanges[_oldLocked.end];
            if (_newLocked.end != 0) {
                if (_newLocked.end == _oldLocked.end) {
                    _newDslope = _oldDslope;
                } else {
                    _newDslope = slopeChanges[_newLocked.end];
                }
            }
        }
        Point memory _lastPoint = Point({ bias: 0, slope: 0, timestamp: block.timestamp, blockNumber: block.number});
        if (_epoch > 0) {
            _lastPoint = pointHistory[_epoch];
        }
        uint _lastCheckPoint = _lastPoint.timestamp;
        Point memory _initialLastPoint = _lastPoint;
        uint _blockSlope = 0;
        if (block.timestamp > _lastPoint.timestamp) {
            _blockSlope = MULTIPLIER * (block.number - _lastPoint.blockNumber) / (block.timestamp - _lastPoint.timestamp);
        }
        uint _tI = (_lastCheckPoint / 1 weeks) * 1 weeks;
        for (int i=0;i<255;i++) {
            _tI += 1 weeks;
            int128 _dSlope = 0;
            if (_tI > block.timestamp) {
                _tI = block.timestamp;
            } else {
                _dSlope = slopeChanges[_tI];
            }
            _lastPoint.bias -= _lastPoint.slope * int128(uint128(_tI - _lastCheckPoint));
            _lastPoint.slope += _dSlope;
            if (_lastPoint.bias < 0) {
                _lastPoint.bias = 0;
            }
            if (_lastPoint.slope < 0) {
                _lastPoint.slope = 0;
            }
            _lastCheckPoint = _tI;
            _lastPoint.timestamp = _tI;
            _lastPoint.blockNumber = _initialLastPoint.blockNumber + _blockSlope * (_tI - _initialLastPoint.timestamp) / MULTIPLIER;
            _epoch += 1;
            if (_tI == block.timestamp) {
                _lastPoint.blockNumber = block.number;
                break;
            } else {
                pointHistory[_epoch] = _lastPoint;
            }
        }
        epoch = _epoch;
        if (_addr != address(0)) {
            _lastPoint.slope += (_uNew.slope - _uOld.slope);
            _lastPoint.bias += (_uNew.bias - _uOld.bias);
            if (_lastPoint.slope < 0) _lastPoint.slope = 0;
            if (_lastPoint.bias < 0) _lastPoint.bias = 0;
        }
        pointHistory[_epoch] = _lastPoint;
        if (_addr != address(0)) {
            if (_oldLocked.end > block.timestamp) {
                _oldDslope += _uOld.slope;
                if (_newLocked.end == _oldLocked.end) _oldDslope -= _uNew.slope;
                slopeChanges[_oldLocked.end] = _oldDslope;
            }
            if (_newLocked.end > block.timestamp) {
                if (_newLocked.end > _oldLocked.end) {
                    _newDslope -= _uNew.slope;
                    slopeChanges[_newLocked.end] = _newDslope;
                }
            }
            uint _userEpoch = userPointEpoch[_addr] + 1;
            userPointEpoch[_addr] = _userEpoch;
            _uNew.timestamp = block.timestamp;
            _uNew.blockNumber = block.number;
            userPointHistory[_addr][_userEpoch] = _uNew;
        }
    }
    /// @dev 向有投票权的账号进行储蓄
    /// 可以用来更改储蓄的金额 / 修改解锁的时间
    function _depositFor(address _addr, uint _value, uint _unlockTime, LockedBalance memory _lockedBalance, int128 _typee) internal {
        LockedBalance memory _locked = _lockedBalance; // 拿到当前用户的存款账号
        uint _supplyBefore = supply; // 记录进行储蓄之前的CRV总供应量
        supply = _supplyBefore + _value; // CRV总供应量更新
        LockedBalance memory _oldLocked = _lockedBalance; // 记录存款更新前的账号
        _locked.amount += int128(int(_value)); // 用户账号余额更新
        if (_unlockTime != 0) _locked.end = _unlockTime; // 如果有解锁时间传入，则更新解锁时间
        locked[_addr] = _locked; // 把更新完的用户存款更新到账户映射中
        _checkPoint(_addr, _oldLocked, _locked); // 计算veCRV！！！！！
        if (_value != 0 ) require(ICRV(token).transferFrom(_addr, address(this), _value)); // 如果有金额存入，从用户地址转移相应数量的CRV进入本合约
        emit Deposit(_addr, _value, _locked.end, _typee, block.timestamp); // 触发储蓄事件
        emit Supply(_supplyBefore, _supplyBefore + _value); // 触发crv储蓄量更新事件
    }
    function _findBlockEpoch(uint _block, uint _maxEpoch) internal view returns (uint) {
        uint _min = 0;
        uint _max = _maxEpoch;
        for(uint i=0;i<128;i++) {
            if (_min >= _max) break;
            uint _mid = (_min + _max + 1) / 2;
            if (pointHistory[_mid].blockNumber <= _block) _min = _mid;
            else _max = _mid - 1;
        }
        return _min;
    }
    function _supplyAt(Point memory _point, uint _t) internal view returns (uint) {
        Point memory _lastPoint = _point;
        uint _tI = (_lastPoint.timestamp / 1 weeks) * 1 weeks;
        for(uint i=0;i<255;i++) {
            _tI += 1 weeks;
            int128 _dSlope = 0;
            if (_tI > _t) _tI = _t;
            else _dSlope = slopeChanges[_tI];
            _lastPoint.bias -= _lastPoint.slope * int128(int(_tI - _lastPoint.timestamp));
            if (_tI == _t) break;
            _lastPoint.slope += _dSlope;
            _lastPoint.timestamp = _tI;
        }
        if (_lastPoint.bias < 0) _lastPoint.bias = 0;
        return uint(uint128(_lastPoint.bias));
    }
}
