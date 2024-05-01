// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@solvprotocol/erc-3525/ERC3525.sol";

contract ERC3525GettingStarted is ERC3525 {
    using Strings for uint;
    address public owner;
    constructor() ERC3525("ERC3525GettingStarted", "ERC3525GS", 18) {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "ERC3525GettingStarted: only owner can mint");
        _;
    }
    function mint(address to, uint slot_, uint amount) public onlyOwner {
        _mint(to, slot_, amount);
    }
}