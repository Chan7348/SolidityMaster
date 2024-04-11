// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract DOGE is ERC721 {
    constructor() ERC721("doge token", "DOGE") {
        for (uint i=0; i< 100; i++) {
            _safeMint(msg.sender, i);
        }
    }
}
