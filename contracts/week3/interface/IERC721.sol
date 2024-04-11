// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { IERC165 } from "./IERC165.sol";

interface IERC721 is IERC165 {
    event Transfer(address indexed from, address indexed to, uint indexed tokenId);

    event Approval(address indexed owner, address indexed approved, uint indexed tokenId);

    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function balanceOf(address owner) external view returns (uint balance);

    function ownerOf(uint tokenId) external view returns (address owner);

    function safeTransferFrom(address from, address to, uint tokenId, bytes calldata data) external;

    function safeTransferFrom(address from, address to, uint tokenid) external;

    function transferFrom(address from, address to, uint tokenId) external;

    function approve(address to, uint tokenId) external;

    function setApprovalForall(address operator, bool approved) external;

    function getApproved(uint tokenId) external view returns (address operator);

    function isApprovedForAll(address owner, address operator) external view returns (bool);
}