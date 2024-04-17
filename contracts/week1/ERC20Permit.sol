// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { ERC20 } from "./ERC20.sol";
import { Ownable } from "./utils/Ownable.sol";
import { IERC20Permit } from "./interfaces/IERC20Permit.sol";
import { ECDSA } from "./utils/ECDSA.sol";

abstract contract ERC20Permit is ERC20, IERC20Permit, Ownable {
    bytes32 public DOMAIN_SEPARATOR;

    // bytes32 public constant PERMIT_TYPEHASH = keccak256("Permit(address holder,address spender,uint256 nonce,uint256 expiry,bool allowed)");
    bytes32 public constant PERMIT_TYPEHASH = 0xea2aa0a1be11a07ed86d755c93467f4f82362b452371d1ba94d1715123511acb;
    string public constant version = "1";
    mapping (address => uint) public nonces;

    constructor(uint chainId_) {
        DOMAIN_SEPARATOR = keccak256(abi.encode(
            keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
            keccak256(bytes(name_)),
            keccak256(bytes(version)),
            chainId_,
            address(this)
        ));
    }


    function permit(address owner, address spender, uint value, uint deadline, uint nonce, uint8 v, bytes32 r, bytes32 s) external {
        require(block.timestamp < deadline, "Signature expired!"); 
        bytes32 digest =
            keccak256(abi.encodePacked(
                "\x19\x01",
                DOMAIN_SEPARATOR,
                keccak256(abi.encode(PERMIT_TYPEHASH,
                                     owner,
                                     spender,
                                     nonce,
                                     deadline
                                     ))
        ));
        address signer = ECDSA.recover(digest, v, r, s);
        require(signer == owner, "Invalid signer");
        approve(spender, value); 
    }
}