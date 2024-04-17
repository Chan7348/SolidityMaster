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