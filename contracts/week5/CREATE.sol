// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract CREATE {
    string public name;
    
    constructor(string memory _name) {
        name = _name;
    }
}   
contract CREATEfactory {
    string public name = "CREATEfactory";
    
    function createCreate(string memory _name) public returns (address) {
        address newContract;
        bytes memory bytecode = abi.encodePacked(type(CREATE).creationCode, abi.encode(_name));
        assembly {
            newContract := create(0, add(bytecode, 32), mload(bytecode))
        }
        return newContract;   
    }
}