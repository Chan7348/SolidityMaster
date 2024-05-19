// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {Monnai} from "./NFT.sol";

contract DutchAuction {
    event StartBid();
    event EndBid(address buyer, uint price);
    Monnai monnai;
    uint startTime;
    bool public hasStarted;
    uint endTime;
    bool public hasEnd;
    uint constant START_PRICE = 1001 ether; // 初始价格
    uint constant END_PRICE = 1 ether; // 强制结束价格
    uint constant DECREMENT = 10 ** 17 wei; // 每秒价格降低的量
    constructor() {
        monnai = new Monnai("Monnai", "MONNAI");
        hasStarted = false;
        hasEnd = false;
    }
    function startBid() external {
        require(!hasStarted);
        startTime = block.timestamp;
        hasStarted = true;
        emit StartBid();
    }
    modifier onlyAfterBidStart() {
        require(startTime != 0, "Bid not started!");
        _;
    }
    modifier onlyBeforeFinish() {
        require(!hasEnd);
        _;
    }
    function getCurrentPrice() external view onlyAfterBidStart returns (uint) {
        return _getPrice();
    }
    function bid(uint price) external onlyAfterBidStart onlyBeforeFinish {
        if (price >= _getPrice()) {
            _end();
            monnai.mint(msg.sender);
            emit EndBid(msg.sender, price);
        }
    }
    function _getPrice() private view returns (uint) {
        uint price = START_PRICE - 1 > DECREMENT * (block.timestamp - startTime) ? START_PRICE - DECREMENT * (block.timestamp - startTime) : 1;
        return price;
    }
    function _end() private {
        hasEnd = true;
        endTime = block.timestamp;
    }
}