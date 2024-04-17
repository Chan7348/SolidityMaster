// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

interface IERC20 {
    // EVENTS

    // MUST trigger when tokens are transferred, including zero value transfers
    // A token contract which creates new tokens MUST trigger a Transfer event with the _from address set to 0x0
    event Transfer(address _from, address _to, uint _value);

    // MUST trigger on all successful calls to approve(address _spender, uint _value)
    event Approval(address _owner, address _spender, uint _value);

    // METHODS

    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    function decimals() external view returns (uint8);

    function totalSupply() external view returns (uint);

    // returns the balance of the specific account with address _owner
    function balanceOf(address _owner) external view returns (uint balance);

    // Transfers _vale amount of tokens from msg.sender to _to
    // MUST fire the Transfer event
    // MUST throw if the msg.sender's balance does not have enough tokens to spend
    // MUST treat transfers of 0 value as normal transfers and fire event
    function transfer(address _to, uint _value) external returns (bool success);

    function transferFrom(address _from, address _to, uint _value) external returns (bool success);

    function approve(address _spender, uint _value) external returns (bool success);

    function allowance(address _owner, address _spender) external view returns (uint remaining);
}