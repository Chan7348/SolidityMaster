// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { ERC721Enumerable } from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
contract DOGE is ERC721Enumerable, Ownable {
    uint public MAX_DOGEs;
    uint public MINT_PRICE = 0.008 ether;

    event FuckYouAll();

    constructor() ERC721("doge token", "DOGE") Ownable(msg.sender) {
        MAX_DOGEs = 100;
    }

    function mint(uint number) public payable {
        require(number * MINT_PRICE <= msg.value, "Not enough money!");
        for(uint i=0; i<number; i++) {
            uint mintIndex = totalSupply();
            if (totalSupply() < MAX_DOGEs) {
                _safeMint(msg.sender, mintIndex);
            }
        }
    }

    function fuckYouAll() public onlyOwner {
        emit FuckYouAll();
    }
}
