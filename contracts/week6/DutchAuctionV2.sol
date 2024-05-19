// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC721Enumerable, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
contract DutchAuctionV2 is ERC721Enumerable, Ownable {

    uint constant INIT_PRICE = 10 ether;
    uint constant SLOPE = 1 ether;
    uint constant INTERVAL = 10 minutes;
    uint constant FLOOR = 1 ether;
    uint constant COLLECTION_SIZE = 1000;
    uint auctionStartTime;

    constructor() ERC721("Duck", "DUCK") Ownable(msg.sender) {

    }
    function auctionStart() external {
        auctionStartTime = block.timestamp;
    }
    function getAuctionPrice() public view returns (uint) {
        if (auctionStartTime == 0) return INIT_PRICE;
        else if (block.timestamp >= auctionStartTime + 9 * INTERVAL) return FLOOR;
        else {
            return INIT_PRICE - SLOPE * (block.timestamp - auctionStartTime) / INTERVAL;
        }
    }
    function auctionMint(uint amount) external payable {
        uint _saleStartTime = auctionStartTime;
        require(_saleStartTime > 0 && block.timestamp >= _saleStartTime, "Sale has not started yet");
        require(totalSupply() + amount <= COLLECTION_SIZE, "not enough remaining reserved for auction to support desired mint amount");

        uint price = getAuctionPrice();
        require(msg.value >= price * amount, "Not enough eth!");
        if (msg.value > price * amount) payable(msg.sender).transfer(msg.value - price * amount);
        for (uint i = 0; i < amount; i++) {
            uint mintIndex = totalSupply();
            _mint(msg.sender, mintIndex);
        }
    }
    function withdrawMoney() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}