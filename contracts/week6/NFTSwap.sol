// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {IERC721Receiver} from "@openzeppelin/contracts/interfaces/IERC721Receiver.sol";
import {IERC721} from "@openzeppelin/contracts/interfaces/IERC721.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
interface INFTSwap {
    event List(address indexed seller, address indexed nftAddr, uint indexed tokenId, uint price);
    event Purchase(address indexed buyer, address indexed nftAddr, uint indexed tokenId, uint price);
    event Revoke(address indexed seller, address indexed nftAddr, uint indexed tokenId);
    event Update(address indexed seller, address indexed nftAddr, uint indexed tokenId, uint newPrice);
    function list(address _nftAddr, uint _tokenId, uint _price) external;
    function revoke(address _nftAddr, uint _tokenId) external;
    function update(address _nftAddr, uint _tokenId, uint _newPrice) external;
    function purchase(address _nftAddr, uint _tokenId) payable external;
}

contract NFTSwap is INFTSwap, IERC721Receiver, ReentrancyGuard {
    struct Order {
        address owner;
        uint price;
    }
    mapping(address nftAddr => mapping(uint nftId => Order)) public nftList;
    receive() external payable {}
    function onERC721Received(address operator, address from, uint tokenId, bytes calldata data) external override returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }
    function list(address _nftAddr, uint _tokenId, uint _price) external nonReentrant {
        IERC721 token = IERC721(_nftAddr);
        // 不允许0元挂单
        require(_price > 0, "Illegal price!");
        // 检查授权
        require(token.getApproved(_tokenId) == address(this) || token.isApprovedForAll(msg.sender, address(this)), "Need Approval!");
        token.safeTransferFrom(msg.sender, address(this), _tokenId);
        Order storage _order = nftList[_nftAddr][_tokenId];
        _order.owner = msg.sender;
        _order.price = _price;
        emit List(msg.sender, _nftAddr, _tokenId, _price);
    }
    function revoke(address _nftAddr, uint _tokenId) external nonReentrant {
        IERC721 token = IERC721(_nftAddr);
        require(msg.sender == nftList[_nftAddr][_tokenId].owner, "Not owner!");
        token.safeTransferFrom(address(this), msg.sender, _tokenId);
        delete nftList[_nftAddr][_tokenId];
        emit Revoke(msg.sender, _nftAddr, _tokenId);
    }
    function update(address _nftAddr, uint _tokenId, uint _newPrice) external nonReentrant {
        Order storage order = nftList[_nftAddr][_tokenId];
        require(msg.sender == order.owner, "Not owner!");
        order.price = _newPrice;
        emit Update(msg.sender, _nftAddr, _tokenId, _newPrice);
    }
    function purchase(address _nftAddr, uint _tokenId) payable external nonReentrant {
        uint bid = msg.value;
        Order memory order = nftList[_nftAddr][_tokenId];
        require(msg.sender != order.owner, "Cannot buy your own nft!");
        require(bid >= order.price, "bid too low!");
        IERC721 token = IERC721(_nftAddr);
        token.safeTransferFrom(address(this), msg.sender, _tokenId);
        payable(order.owner).transfer(bid);
        delete nftList[_nftAddr][_tokenId];
        emit Purchase(msg.sender, _nftAddr, _tokenId, bid);
    }
}