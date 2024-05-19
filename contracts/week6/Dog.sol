// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Dog is ERC20("ikun", "DOG") {
    constructor() {
        _mint(msg.sender, 10 * 10 ** decimals());
    }
}