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

    mapping(address => personalVeLock[]) private userLocks;
    address[] public users;

    event AddLock(address indexed user, uint amount, uint duration);
    event WithdrawLock(address indexed user, uint amount);

    LOCK public token = LOCK(0xBE474255dC5946eB46125973AE50538b42542b77);
    constructor() Ownable(msg.sender) {
    }

    function addLock(uint amount, uint duration) public {
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

    function withdrawLock(uint index) public {
        require(index < userLocks[msg.sender].length, "Index out of range");

        personalVeLock storage lock = userLocks[msg.sender][index];
        require(block.timestamp >= lock.unlockTime, "Lock is still in progress");

        LOCK(token).transfer(msg.sender, lock.amount);

        userLocks[msg.sender][index] = userLocks[msg.sender][userLocks[msg.sender].length - 1];
        userLocks[msg.sender].pop();

        emit WithdrawLock(msg.sender, lock.amount);
    }

    function getVotingPower(address user) public view returns (uint power, uint totalPower) {
        uint personal = _calculatePersonalVeLOCK(user);
        uint system = _calculateTotalVeLOCK();

        require(system > 0, "No VeLOCK in the system, cannot calculate voting power.");

        return (personal, system);
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