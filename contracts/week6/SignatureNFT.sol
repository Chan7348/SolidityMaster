// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
library ECDSA {
    /// @dev 验证签名的地址是否正确
    function verify(bytes32 _msgHash, bytes memory _signature, address _signer) internal pure returns (bool) {
        return recoverSigner(_msgHash, _signature) == _signer;
    }
    /// @dev 从消息和签名恢复出签名者的地址
    function recoverSigner(bytes32 _msgHash, bytes memory _signature) internal pure returns (address) {
        // 检查签名长度，65是一个标准的r,s,v签名的长度
        require(_signature.length == 65, "invalid signature length");
        bytes32 r;
        bytes32 s;
        uint8 v;
        assembly {
            r := mload(add(_signature, 0x20))
            s := mload(add(_signature, 0x40))
            v := mload(add(_signature, 0x60))
        }
        return ecrecover(_msgHash, v, r, s);
    }
    /// @dev 把普通的消息转化为以太坊签名消息，防止用于交易
    function toEthSignedMessageHash(bytes32 hash) public pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}
contract SignatureNFT is ERC721 {
    address immutable public signer;
    mapping(address => bool) public mintedAddress;
    constructor(string memory _name, string memory _symbol, address _signer) ERC721(_name, _symbol) {
        signer = _signer;
    } 
    function mint(address _account, uint _tokenId, bytes memory _signature) external {
        bytes32 _msgHash = getMessageHash(_account, _tokenId);// 将account和tokenid打包成消息
        bytes32 _ethSignedMessageHash = ECDSA.toEthSignedMessageHash(_msgHash);
        require(verify(_ethSignedMessageHash, _signature), "Invalid signature"); // ECDSA检验通过
        require(!mintedAddress[_account], "Already minted!");
        mintedAddress[_account] = true;
        _mint(_account, _tokenId);
    }
    function getMessageHash(address _account, uint _tokenId) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_account, _tokenId));
    }
    function verify(bytes32 _msgHash, bytes memory _signature) public view returns (bool) {
        return ECDSA.verify(_msgHash, _signature, signer);
    }
}
