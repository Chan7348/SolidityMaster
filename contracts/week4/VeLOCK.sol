// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { LOCK } from  "./LOCK.sol";

contract Ownable {
    address private owner_;

    event TransferOwnership(address oldOne, address newOne);
    constructor(address _owner) {
        owner_ = _owner;
    }

    function getOwner() public view returns (address){
        return owner_;
    }

    modifier onlyOwner {
        require(msg.sender == owner_, "YOU ARE NOT OWNER!!");
        _;
    }

    // include ownership give up
    function transferOwnership(address _newOwner) public onlyOwner {
        owner_ = _newOwner;
        emit TransferOwnership(msg.sender, _newOwner);
    }
}

// VeLOCK, 投票治理代币-非标准ERC20

//     用户锁定LOCK，提供数量和锁定时长, 
//     我们记录本次锁定的一些固定数据，每次锁定都是分开的独立结构体：
//     struct VeLock {
//         uint amount; //质押的LOCK数量
//         uint originTime; //初始锁定时间
//         uint duration; //锁定时长
//         uint unlockTime; //解锁时间
//         uint originVeLock; //初始的VeLOCK计算结果
//     }

//     锁定逻辑：最小锁定时间为30天，最大锁定时间为一年。假如一个人锁定一个LOCK 365天，那么他立即得到一个VeLOCK，这个VeLOCK每天会减少初始量的1/365，减少的时间间隔为一天。到期之后可以取出，也可以继续存放，不过过期的LOCK不会有对应的VeLOCK了。


//     数据结构：
//         一个数组用来储存所有的用户 address[] public users;
//         一个mapping用来根据用户的地址查询他所有的锁定 mapping(address => personalVeLock[]) private userLocks;


//     内部函数：
//         function _isUserExists(address user) internal view returns (bool);
//             查询用户是否有LOCK在合约里（包含锁定中+锁定过期未取出的LOCK）
        
//         function _calculatePersonalVeLOCK(address user) internal view returns (uint);
//             根据个人的LOCK存档计算他当前的的VeLOCK

//         function _calculateTotalVeLOCK() internal view returns (uint);
//             累加所有人的VeLOCK得到VeLOCK总量

    
//     外部函数：
//         function addLock(uint amount, uint duration) external;
//             为新用户或者老用户锁定一定数量的LOCK

//         function withdrawLock(uint index) external;
//             为老用户取出锁定完成的LOCK

//         function getVotingPower(address user) external view returns (uint power, uint totalPower);
//             得到个人VeLOCK和VeLOCK总量，可以用来计算投票权

//         function totalSupply() external view returns (uint);
//             得到VeLOCK总供应量
        
//         function balanceOf(address user) external view returns (uint);
//             得到个人的VeLOCk数量

//     公共函数:
//         name()
//         symbol()
//         decimals()
//         users() -> 根据index查询用户地址
//         token() -> LOCK实例地址

//     事件: 
//         event AddLock(address indexed user, uint amount, uint duration);
//         event WithdrawLock(address indexed user, uint amount);





contract VeLOCK is Ownable {
    string public name = "Vote-escrowed LOCK";
    string public symbol = "VeLOCK";
    uint8 public decimals = 3;
    struct personalVeLock {
        uint amount; //质押的LOCK数量
        uint originTime; //初始锁定时间
        uint duration; //锁定时长，单位为天
        uint unlockTime; //解锁时间
        uint originVeLock; //初始的VeLOCK计算结果
    }

    mapping(address => personalVeLock[]) private userLocks;
    address[] public users;

    event AddLock(address indexed user, uint amount, uint duration);
    event WithdrawLock(address indexed user, uint amount);

    LOCK public token = LOCK(0xBE474255dC5946eB46125973AE50538b42542b77);
    constructor() Ownable(msg.sender) {
    }

    function addLock(uint amount, uint duration) external {
        require(amount > 0, "Lock amount must be greater than 0");
        require(duration >= 30 && duration <= 365, "Lock duration must be between 30 and 365 days");

        uint originTime = block.timestamp;
        uint unlockTime = originTime + duration * 1 days;
        uint originVeLock = (amount * duration) / 365;

        LOCK(token).transferFrom(msg.sender, address(this), amount);

        userLocks[msg.sender].push(personalVeLock({
            amount: amount,
            originTime: originTime,
            duration: duration,
            unlockTime: unlockTime,
            originVeLock: originVeLock
        }));

        if (!_isUserExists(msg.sender)) users.push(msg.sender);

        emit AddLock(msg.sender, amount, duration);
    }

    function withdrawLock(uint index) external {
        require(index < userLocks[msg.sender].length, "Index out of range");

        personalVeLock storage lock = userLocks[msg.sender][index];
        require(block.timestamp >= lock.unlockTime, "Lock is still in progress");

        LOCK(token).transfer(msg.sender, lock.amount);

        userLocks[msg.sender][index] = userLocks[msg.sender][userLocks[msg.sender].length - 1];
        userLocks[msg.sender].pop();

        emit WithdrawLock(msg.sender, lock.amount);
    }

    function getVotingPower(address user) external view returns (uint power, uint totalPower) {
        uint personal = _calculatePersonalVeLOCK(user);
        uint system = _calculateTotalVeLOCK();

        require(system > 0, "No VeLOCK in the system, cannot calculate voting power.");

        return (personal, system);
    }

    function totalSupply() external view returns (uint) {
        return _calculateTotalVeLOCK();
    }

    function balanceOf(address user) external view returns (uint) {
        return _calculatePersonalVeLOCK(user);
    }

    function _calculatePersonalVeLOCK(address user) internal view returns (uint) {
        uint amount = 0;
        personalVeLock[] memory locks = userLocks[user];

        for (uint i = 0; i < locks.length; i++) {
            personalVeLock memory lock = locks[i];
            if (block.timestamp >= lock.unlockTime) continue;
            uint daysElapsed = (block.timestamp - lock.originTime) / 1 days;
            uint remainingDays = lock.duration - daysElapsed;
            uint currentVeLock = lock.originVeLock * remainingDays / lock.duration;
            amount += currentVeLock;
        }
        return amount;
    }

    function _calculateTotalVeLOCK() internal view returns (uint) {
        uint amount = 0;
        for (uint i = 0; i < users.length; i++) {
            amount += _calculatePersonalVeLOCK(users[i]);
        }
        return amount;
    }

    

    function _isUserExists(address user) internal view returns (bool) {
        for (uint i = 0; i < users.length; i++) {
            if (users[i] == user) {
                return true;
            }
        }
        return false;
    }
}