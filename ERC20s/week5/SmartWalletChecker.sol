// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract SmartWalletChecker {
    
    mapping(address => bool) public wallets;
    address public checker;
    address public future_checker;
    
    event ApproveWallet(address);
    event RevokeWallet(address);
    
    constructor() {
        wallets[msg.sender] = true;
    }
    
    function commitSetChecker(address _checker) external {
        future_checker = _checker;
    }
    
    function applySetChecker() external {
        checker = future_checker;
    }
    
    function approveWallet(address _wallet) public {
        wallets[_wallet] = true;
        
        emit ApproveWallet(_wallet);
    }
    function revokeWallet(address _wallet) external {
        wallets[_wallet] = false;
        
        emit RevokeWallet(_wallet);
    }
    
    function check(address _wallet) external view returns (bool) {
        bool _check = wallets[_wallet];
        if (_check) {
            return _check;
        }
        return false;
    }
}