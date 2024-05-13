// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { Test, console } from "forge-std/Test.sol";
import { ICRV, CRV } from "contracts/week5/CRV.sol";
import { Faucet } from "contracts/week6/Faucet.sol";
contract testCRV is Test {
    CRV crv;
    function setUp() public {
        vm.warp(1715325863);
        crv = new CRV();
        console.log("timestamp:", block.timestamp);
        console.log("msg.sender:", msg.sender);
        console.log("address(this):", address(this));
        console.log("crv admin:", crv.admin());
        vm.warp(block.timestamp + 2 days);
        crv.update_mining_parameters();
    }
    function testInit() public view {
        assertEq(crv.admin(), address(this));
    }
    function testMint() public {
        uint totalSupplyBeforeMint = crv.totalSupply();
        crv.set_minter(address(this));
        crv.mint(address(this), 100000);
        assertEq(crv.totalSupply(), totalSupplyBeforeMint + 100000);
    }
    function testBurn() public {
        uint totalSupplyBeforeBurn = crv.totalSupply();
        uint balanceBeforeBurn = crv.balanceOf(address(this));
        crv.burn(100000);
        assertEq(crv.totalSupply(), totalSupplyBeforeBurn - 100000);
        assertEq(crv.balanceOf(address(this)), balanceBeforeBurn - 100000);
    }
    function testSetName() public {
        crv.set_name("new name", "new symbol");
        assertEq(crv.name(), "new name");
        assertEq(crv.symbol(), "new symbol");
    }
    function testGetMintable() public {
        uint aftertime = block.timestamp + 500 days;
        console.log("aftertime:", aftertime);
        console.log("mintable:", crv.mintable_in_timeframe(block.timestamp, aftertime));
    }
}