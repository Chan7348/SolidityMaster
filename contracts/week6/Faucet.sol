// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IFaucet {
    event TokenRequested(address indexed to, uint256 amount);
    function requestToken() external;
}
contract Faucet is IFaucet {
    IERC20 public token;
    address public owner;
    mapping(address => uint) private requested;
    constructor(address _token) {
        token = IERC20(_token);
        owner = msg.sender;
    }
    modifier notRequested {
        require(requested[msg.sender] == 0, "Faucet: Limit reached!");
        _;
    }
    modifier onlyOwner {
        require(msg.sender == owner, "Faucet: only owner");
        _;
    }
    function requestToken() external notRequested {
        require(block.timestamp >= requested[msg.sender] + 1 weeks);
        token.transfer(msg.sender, 100);
        requested[msg.sender] = block.timestamp;
        emit TokenRequested(msg.sender, 100);
    }
    function withdraw(uint amount) external onlyOwner {
        token.transfer(msg.sender, amount);
    }
}