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


contract VeLOCK is Ownable {

    struct personalVeLock {
    uint amount; //质押的LOCK数量
    uint originTime; //初始锁定时间
    uint duration; //锁定时长，单位为天
    uint unlockTime; //解锁时间
    uint originVeLock; //初始的VeLOCK计算结果
    }

    mapping(address => personalVeLock[]) public userLocks;
    address[] public users;

    uint private totalLOCKstaked;
    uint private totalVeLock;

    LOCK internal token;
    constructor(address tokenAddr) Ownable(msg.sender) {
        token = LOCK(tokenAddr);
    }

    // for all
    
    function addLock(uint amount, uint duration) public {
        require(amount>0, "Lock amount must be greater than 0");
        require(duration>0 && duration<=365, "Lock duration must be between 1 and 365 days");

        uint originTime = block.timestamp;
        uint unlockTime = originTime + duration * 1 days;
        uint originVeLock = (amount * duration) / 365;

        //添加或者更新用户锁定信息
        userLocks[msg.sender].push(personalVeLock({
            amount: amount,
            originTime: originTime,
            duration: duration,
            unlockTime: unlockTime,
            originVeLock: originVeLock
        }));
        if (_isUserExists(msg.sender)) users.push(msg.sender);
    }

    function stake() external returns (bool) {

    }

    function getVeToken(address owner) external returns (bool) {

    } 

    function getTotalLOCKstaked() public view returns (uint) {

    }

    function getTotalVeLock() public returns (uint) {

    }


    // for single user



    function checkLOCK() public returns (uint locked, uint unlocked) {

    }

    /// @dev  if amount = 1, all = 100, you have 1% power to vote
    function getVoteRight() public returns (uint amount, uint all) {

    }

    function withdraw() public returns (bool) {

    }



    // 内部
    function _checkSingle() internal {}

    function _isUserExists(address user) internal view returns (bool) {
        for (uint i = 0; i < users.length; i++) {
            if (users[i] == user) {
                return true;
            }
        }
        return false;
    }
}
