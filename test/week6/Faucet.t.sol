// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import { Test, console } from "forge-std/Test.sol";
import { Faucet } from "contracts/week6/Faucet.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract LID is ERC20("LID Token", "LID") {
    constructor() {
        _mint(msg.sender, 10 * 10 ** decimals());
    }
}
contract FaucetTest is Test {
    Faucet faucet;
    ERC20 token;
    address public owner;
    function setUp() public {
        token = new LID();
        faucet = new Faucet(address(token));
        owner = msg.sender;
        token.transfer(address(faucet), 10 * 1e18);
    }
    // function testToken() public {
    //     console.log("Total supply: ", token.totalSupply());
    //     console.log("token in faucet: ", token.balanceOf(address(faucet)));
    //     faucet.requestToken();
    //     assertEq(token.balanceOf(address(this)), 100);
    //     assertEq(token.balanceOf(address(faucet)), 10 * 1e18 - 100);
    // }
    function testFailedToken() public {
        faucet.requestToken();
        faucet.requestToken();
    }
    // function testRevert() public {
    //     uint k=1;
    //     k = change(k);
    //     console.log("k=", k);
    // }
    function change(uint k) private pure returns (uint){
        k = 2;
        return k;
    }
}