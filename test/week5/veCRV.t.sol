// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { Test, console} from "forge-std/Test.sol";
import { CRV } from "contracts/week5/CRV.sol";
import { veCRV } from "contracts/week5/veCRV.sol";
import { SmartWalletChecker } from "contracts/week5/SmartWalletChecker.sol"; 
contract TestveCRV is Test {
    CRV crv;
    veCRV veCrv;
    SmartWalletChecker checker;
    struct Lock {
        uint time;
        uint amount;
    }
    Lock p0 = Lock(1,1);
    function setUp() public {
        vm.warp(1715325863);
        checker = new SmartWalletChecker();
        crv = new CRV();
        veCrv = new veCRV(address(crv), "veCRV", "veCRV", "1");
        veCrv.commitSmartWalletChecker(address(checker));
        veCrv.applySmartWalletChecker();
    }
    function testInit() public {
        assertEq(veCrv.name(), "veCRV");
        assertEq(veCrv.symbol(), "veCRV");
        assertEq(veCrv.decimals(), crv.decimals());
    }
    function testDeposit() public {
        console.log("crv balance:", crv.balanceOf(address(this)));
        console.log("checker:", veCrv.smartWalletChecker());
        assertEq(veCrv.smartWalletChecker(), address(checker));
        crv.approve(address(veCrv), 1e22);
        veCrv.createLock(8e18, block.timestamp + 9 weeks);
        veCrv.depositFor(address(this), 7e18);
        console.log("balance:", veCrv.balanceOf(address(this)));
    }
    function testDataType() public {
        dataType(p0);
    }
    function dataType(Lock storage p_) private {
        Lock memory p1 = p0;
        Lock memory p2 = p0;
        p1.time = 100000000;
        p1.amount = 100000000;
        console.log("global:",p0.time);
        console.log("parameter:",p_.time);
        console.log("p1:",p1.time);
        console.log("p2:",p2.time);
    }
}