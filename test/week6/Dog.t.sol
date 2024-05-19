// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {Test, console} from "forge-std/Test.sol";
import {Dog} from "contracts/week6/Dog.sol";

contract TestWkol is Test {
    Dog dog;
    address public A;
    address public B;
    function setUp() public {
        dog = new Dog();
        A = vm.addr(1); // 生成一个新的EOA
        B = vm.addr(2); // 生成一个新的EOA
        vm.deal(A, 1000 ether); // 给B 1000 ETH
    }
    function testTransfer() public {
        console.log("Owner balance:%e", dog.balanceOf(address(this)));

        // test transfer
        dog.transfer(address(A), 10 * 10 ** dog.decimals());
        console.log("A balance:%e", dog.balanceOf(address(A)));

        vm.startPrank(A); // 模拟A的账号
        dog.transfer(address(B), 10 * 10 ** dog.decimals());
        vm.stopPrank(); // 停止模拟

        console.log("A balance:%e", dog.balanceOf(address(A)));
    }
}