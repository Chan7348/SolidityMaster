// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;


import { ERC20 } from "./ERC20.sol";
import { Ownable } from "./utils/Ownable.sol";



contract BASIC is ERC20, Ownable {
    constructor() ERC20("basic token", "BASIC", 8) Ownable(msg.sender) {
        balance_[msg.sender] = 2000_0000_0000_0000;
        totalSupply_ = 2000_0000_0000_0000;
    }
}