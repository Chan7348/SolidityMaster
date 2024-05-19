// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
contract MerkleTree is ERC721 {
    bytes32 immutable public root;
    mapping(address => bool) public mintedAddress;
    constructor(string memory _name, string memory _symbol, bytes32 merkleRoot) ERC721(_name, _symbol) {
        root = merkleRoot;
    }
    function mint(address account, uint tokenId, bytes32[] calldata proof) external {
        require(_verify(_leaf(account), proof), "Invalid merkle proof!");
        require(!mintedAddress[account], "Already minted!");
        _mint(account, tokenId);
        mintedAddress[account] = true;
    }
    function _leaf(address account) private pure returns (bytes32) {
        return keccak256(abi.encodePacked(account));
    }
    function _verify(bytes32 leaf, bytes32[] memory proof) private view returns (bool) {
        return MerkleProof.verify(proof, root, leaf);
    }
}