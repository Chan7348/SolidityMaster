// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Ownable {
    address private owner_;

    event TransferOwnership(address oldOne, address newOne);
    constructor(address _owner) {
        owner_ = _owner;
    }

    function getOwner() public view returns (address){
        return owner_;
    }

    modifier onlyOwner {
        require(msg.sender == owner_, "YOU ARE NOT OWNER!!");
        _;
    }

    // include ownership give up
    function transferOwnership(address _newOwner) public onlyOwner {
        owner_ = _newOwner;
        emit TransferOwnership(msg.sender, _newOwner);
    }
}

contract LOCK is Ownable {

    event Transfer(address _from, address _to, uint _value);
    event Approval(address _owner, address _spender, uint _value);
    error ERC20InsufficientBalance(address caller, address from, uint need, uint value);
    error ERC20InvalidSpender(address spender, address owner);
    error ERC20InsufficientAllowance(address spender, address owner, uint need, uint value);

    string public name;
    string public symbol;
    uint8 public decimals;
    uint public totalSupply;
    mapping(address owner => uint) balance_;
    mapping(address owner => mapping(address spender => uint)) allowance_;

    constructor() Ownable(msg.sender) {
        name = "lock token";
        symbol = "LOCK";
        decimals = 3;
        totalSupply = 2100_0000_000;
        balance_[msg.sender] = totalSupply;
    }

    // VIEW functions

    function allowance(address _owner, address _spender) external view returns (uint remaining) {
        return allowance_[_owner][_spender];
    }

    

    // returns the balance of the specific account with address _owner
    function balanceOf(address _owner) external view returns (uint balance) {
        return balance_[_owner];
    }

    // ACTIVE functions

    
    // Transfers _vale amount of tokens from msg.sender to _to
    // MUST fire the Transfer event
    // MUST throw if the msg.sender's balance does not have enough tokens to spend
    // MUST treat transfers of 0 value as normal transfers and fire event
    function transfer(address _to, uint _value) public returns (bool success) {

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

        require(_to != address(0), "Cannot transfer to 0 address");

        balance_[msg.sender] -= _value;
        balance_[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
    }   

    // Transfers _value amount of tokens from address _from to address _to
    // MUST fire the Transfer event
    // used for a withdraw workflow, allowing contracts to transfer tokens on your behalf.
    // MUST throw unless the _from account deliberately authorized the sender of the message
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
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
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // new functions
    function mint(uint amount) public onlyOwner returns (bool) {
        totalSupply += amount;
        balance_[msg.sender] += amount;
        emit Transfer(address(0), msg.sender, amount);
        return true;
    }
    
    function burn(uint amount) public returns (bool) {
        balance_[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
        return true;
    }

}