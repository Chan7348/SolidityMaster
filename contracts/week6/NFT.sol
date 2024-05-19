// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {IERC721Receiver} from "./interface/IERC721Receiver.sol";

interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

interface IERC721 is IERC165 {
    event Transfer(address indexed from, address indexed to, uint indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
    function balanceOf(address owner) external view returns (uint balance);
    function ownerOf(uint tokenId) external view returns (address owner);
    function safeTransferFrom(address from, address to, uint tokenId, bytes calldata data) external payable;
    function safeTransferFrom(address from, address to, uint tokenId) external payable;
    function transferFrom(address from, address to, uint tokenId) external payable;
    function approve(address to, uint tokenId) external payable;
    function setApprovalForAll(address operator, bool _approved) external;
    function getApproved(uint tokenId) external view returns (address operator);
    function isApprovedForAll(address owner, address operator) external view returns (bool);
}

interface IERC721Metadata is IERC721 {
    function name() external view returns (string memory _name);
    function symbol() external view returns (string memory _symbol);
    function tokenURI(uint _tokenId) external view returns (string memory);
}
contract Monnai is IERC721Metadata {
    mapping(address => uint) private _balance;
    mapping(uint => address) private _idToOwner;
    mapping(uint id => address spender) private _allowances;
    mapping(address owner => mapping(address spender => bool)) private _isOperator;
    uint constant TOTAL_SUPPLY = 100;
    string public name;
    string public symbol;
    address private _owner;
    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        _owner = msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == _owner);
        _;
    }
    function setOwner(address newOne) external onlyOwner{
        _owner = newOne;
    }
    function mint(address to) external onlyOwner {
        _balance[to] = TOTAL_SUPPLY;
        for (uint i=0;i<100;i++) {
            _idToOwner[i] = to; 
        }
    }
    function balanceOf(address owner) external view returns (uint balance) {
        require(owner != address(0), "Invalid address!");
        balance = _balance[owner];
    }
    function ownerOf(uint tokenId) public view returns (address owner) {
        owner = _idToOwner[tokenId];
        require(owner == address(0), "Invalid token");
    }
    function safeTransferFrom(address from, address to, uint tokenId, bytes calldata data) external payable {
        require(_moveRightCheck(tokenId, msg.sender), "Do not have the right to transfer");
        require(to != address(0), "Cannot move to zero address");
        address owner = ownerOf(tokenId);
        require(owner == from, "from is not the owner");
        _transfer(tokenId, to);
        _checkOnERC721Received(from, to, tokenId, data);
    }
    function safeTransferFrom(address from, address to, uint tokenId) external payable {
        require(_moveRightCheck(tokenId, msg.sender), "Do not have the right to transfer");
        require(to != address(0), "Cannot move to zero address");
        address owner = ownerOf(tokenId);
        require(owner == from, "from is not the owner");
        _transfer(tokenId, to);
        bytes memory data;
        _checkOnERC721Received(from, to, tokenId, data);
    }
    function transferFrom(address from, address to, uint tokenId) external payable {
        require(_moveRightCheck(tokenId, msg.sender), "Do not have the right to transfer");
        require(to != address(0), "Cannot move to zero address");
        address owner = ownerOf(tokenId);
        require(from == owner, "from is not the owner");
        _transfer(tokenId, to);
    }
    function approve(address to, uint tokenId) external payable {
        address owner = ownerOf(tokenId);
        require(msg.sender == owner || _isOperator[owner][msg.sender]);
        _allowances[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }
    function setApprovalForAll(address operator, bool _approved) external {
        _isOperator[msg.sender][operator] = _approved;
        emit ApprovalForAll(msg.sender, operator, _approved);
    }
    function getApproved(uint tokenId) external view returns (address operator) {
        return ownerOf(tokenId);
    }
    function isApprovedForAll(address owner, address operator) external view returns (bool) {
        return _isOperator[owner][operator];
    }
    function supportsInterface(bytes4 interfaceId) external pure returns (bool) {
        return interfaceId == type(IERC721).interfaceId || interfaceId == type(IERC165).interfaceId;
    }
    function _moveRightCheck(uint id, address user) private view returns (bool) {
        return _idToOwner[id] == user || _allowances[id] == user || _isOperator[_idToOwner[id]][user];
    }
    function _transfer(uint id, address to) private {
        address owner = ownerOf(id);
        _balance[owner]--;
        _balance[to]++;
        _idToOwner[id] = to;
        _allowances[id] = address(0);
        emit Transfer(owner, to, id);
    }
    function _checkOnERC721Received(address from, address to, uint tokenId, bytes memory data) private returns (bool) {
        if (isContract(to)) return IERC721Receiver(to).onERC721Received(msg.sender, from, tokenId, data) == IERC721Receiver.onERC721Received.selector;
        return true;
    }
    function isContract(address addr) private view returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }
    function tokenURI(uint _tokenURI) external pure returns (string memory) {
        return "";
    }
}

