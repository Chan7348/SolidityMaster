// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { IERC721 } from "./interface/IERC721.sol";
import { IERC721Metadata } from "./interface/IERC721Metadata.sol";
import { IERC721Receiver } from "./interface/IERC721Receiver.sol";
import { Context } from "./utils/Context.sol";
import { Strings } from "./utils/Strings.sol";
import { IERC165, ERC165 } from "./utils/ERC165.sol";
import { IERC721Errors } from "./interface/draft-IERC6093.sol";

abstract contract ERC721 is IERC721, IERC721Metadata, IERC721Errors, IERC721Receiver, ERC165 {
    string private _name;
    string private _symbol;

    mapping(uint tokenId => address) private _owners;
    mapping(address owner => uint) private _balances;
    mapping(uint tokenId => address) private _tokenApprovals;
    mapping(uint owner => mapping(address operator => bool)) private _operatorApprovals;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    // view functions 

    function name() external view virtual returns (string memory) {
        return _name;
    }

    function symbol() external view virtual returns (string memory) {
        return _symbol;
    }

    function tokenURI(uint tokenId) external view virtual returns (string memory) {
        return _baseURI(tokenId);
    }

    function _baseURI(uint tokenId) internal view virtual returns (string memory) {
        return "";
    }

    function balanceOf(address owner) external view virtual returns (uint balance) {
        return _balances[owner];
    }

    function ownerOf(uint tokenId) external view virtual returns (address owner) {
        return _owners[tokenId];
    }

    // action functions


    function mint() public virtual returns (uint tokenId) {

    }

    function burn(uint tokenId) public virtual returns (bool) {

    }

    function safeTransferFrom(address from, address to, uint tokenId, bytes calldata data) external virtual {

    }

    function safeTransferFrom(address from, address to, uint tokenid) external virtual {

    }

    function transferFrom(address from, address to, uint tokenId) external virtual {

    }

    function approve(address to, uint tokenId) external virtual {

    }

    function setApprovalForall(address operator, bool approved) external virtual {

    }

    function getApproved(uint tokenId) external view virtual returns (address operator) {

    }

    function isApprovedForAll(address owner, address operator) external view virtual returns (bool) {

    }

    function onERC721Received(
        address operator,
        address from,
        uint tokenId,
        bytes calldata data
    ) external virtual returns (bytes4) {

    }


}

