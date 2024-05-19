// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

interface ISmartWalletChecker {
    function check(address addr) external returns (bool);
}