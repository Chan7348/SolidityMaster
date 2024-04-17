// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.24;

import { IERC20 } from "./interfaces/IERC20.sol";
import { IERC20Errors } from "./interfaces/IERC20Errors.sol";
abstract contract ERC20 is IERC20, IERC20Errors {

    string public name_;
    string public symbol_;
    uint8 public decimals_;
    uint public totalSupply_;
    mapping(address owner => uint) balance_;
    mapping(address owner => mapping(address spender => uint)) allowance_;

    constructor(string memory _name, string memory _symbol, uint8 _decimals) {
        name_ = _name;
        symbol_ = _symbol;
        decimals_ = _decimals;
    }

    // VIEW functions

    function name() external view virtual returns (string memory) {
        return name_;
    }

    function symbol() external view virtual returns (string memory) {
        return symbol_;
    }

    function decimals() external view virtual returns (uint8) {
        return decimals_;
    }

    function allowance(address _owner, address _spender) external view virtual returns (uint remaining) {
        return allowance_[_owner][_spender];
    }

    function totalSupply() external view returns (uint) {
        return totalSupply_;
    }

    // returns the balance of the specific account with address _owner
    function balanceOf(address _owner) external view virtual returns (uint balance) {
        return balance_[_owner];
    }

    // ACTIVE functions

    
    // Transfers _vale amount of tokens from msg.sender to _to
    // MUST fire the Transfer event
    // MUST throw if the msg.sender's balance does not have enough tokens to spend
    // MUST treat transfers of 0 value as normal transfers and fire event
    function transfer(address _to, uint _value) public virtual returns (bool success) {

        // 0 value transfer
        // to save gas
        if (_value == 0) { 
            emit Transfer(msg.sender, _to, _value);
            return success;
        }

        // insufficient balance
        if (balance_[msg.sender] < _value) {
            revert ERC20InsufficientBalance(msg.sender, msg.sender, _value, balance_[msg.sender]);
        }

        balance_[msg.sender] -= _value;
        balance_[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
    }   

    // Transfers _value amount of tokens from address _from to address _to
    // MUST fire the Transfer event
    // used for a withdraw workflow, allowing contracts to transfer tokens on your behalf.
    // MUST throw unless the _from account deliberately authorized the sender of the message
    function transferFrom(address _from, address _to, uint _value) public virtual returns (bool success) {
        uint originalAllowance = allowance_[_from][msg.sender];
        if (originalAllowance > 0){
            if (originalAllowance < _value) revert ERC20InsufficientAllowance(msg.sender, _from, _value, originalAllowance);

            allowance_[_from][msg.sender] = originalAllowance - _value;
            balance_[_from] -= _value;
            balance_[_to] += _value;

            emit Transfer(_from, _to, _value);
            return true;
        }

        revert ERC20InvalidSpender(msg.sender, _from);
    }

    // allow spender to embezzle your token up to the _value in multiple times
    // if call again, override the value
    function approve(address _spender, uint _value) public virtual returns (bool success) {
        allowance_[msg.sender][_spender] = _value;
        return true;
    }
      

}