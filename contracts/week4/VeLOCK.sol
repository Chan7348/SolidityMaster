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

    struct VeLock {
    uint amount; //质押的LOCK数量
    uint originTime; //初始锁定时长
    uint duration; //锁定时长
    uint unlockTime; //解锁时间
    uint originVeLock; //初始的VeLOCK计算结果
    }

    mapping(address => VeLOCK[]) public userLocks;

    uint private totalLOCKstaked;
    uint private totalVeLock;

    LOCK internal token;
    constructor(address tokenAddr) Ownable(msg.sender) {
        token = LOCK(tokenAddr);
    }

    function stake() external returns (bool) {

    }

    function getVeToken(address owner) external returns (bool) {

    } 
}
