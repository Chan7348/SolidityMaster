// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract Airdrop {
    address public owner;
    modifier onlyOwner {
        require(msg.sender == owner, "Airdrop: only owner");
        _;
    }
    constructor() {
        owner = msg.sender;
    }
    function withdraw(address _token) external onlyOwner {
        IERC20 token = IERC20(_token);
        require(token.balanceOf(address(this)) > 0, "Airdrop: no balance");
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }
    function airdrop(address _token, address[] calldata recipients, uint[] calldata amount) external onlyOwner {
        require(recipients.length == amount.length, "Airdrop: invalid input");
        for (uint i = 0; i < recipients.length; i++) {
            IERC20(_token).transfer(recipients[i], amount[i]);
        }
    }

}