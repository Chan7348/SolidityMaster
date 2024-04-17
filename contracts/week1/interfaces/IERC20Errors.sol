// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

interface IERC20Errors {
    error ERC20InsufficientBalance(address caller, address from, uint need, uint value);
    error ERC20InvalidSpender(address spender, address owner);
    error ERC20InsufficientAllowance(address spender, address owner, uint need, uint value);
}