import { STRAIGHT } from './../typechain-types/contracts/week4/STRAIGHT.sol/STRAIGHT';
import { VeSTRAIGHT } from './../typechain-types/contracts/week4/VeSTRAIGHT.sol/VeSTRAIGHT';

import { STRAIGHT__factory } from './../typechain-types/factories/contracts/week4/STRAIGHT.sol/STRAIGHT__factory';

import { expect } from "chai";
import { ethers } from "hardhat";
import { loadFixture, time } from "@nomicfoundation/hardhat-toolbox/network-helpers";



describe("STRAIGHT", () => {// name of the contract
    async function deploySTRAIGHT() {
        const STRAIGHT__factory = await ethers.getContractFactory("STRAIGHT");
        const STRAIGHT = await STRAIGHT__factory.deploy();
        await STRAIGHT.waitForDeployment();

        const VeSTRAIGHT__factory = await ethers.getContractFactory("veSTRAIGHT");
        const VeSTRAIGHT= await VeSTRAIGHT__factory.deploy(await STRAIGHT.getAddress());
        await VeSTRAIGHT.waitForDeployment();
        const [ owner, addr1, addr2 ] = await ethers.getSigners();
        return { STRAIGHT, VeSTRAIGHT, owner, addr1, addr2 };
    }
    

    it("Should init correctly", async () => {
        const { STRAIGHT, VeSTRAIGHT, owner} = await loadFixture(deploySTRAIGHT);
        // expect(await STRAIGHT.balanceOf(owner.address)).to.equal(21000000000);
        // expect(await STRAIGHT.name()).to.equal("straight token");
        // expect(await STRAIGHT.symbol()).to.equal("STRAIGHT");
        // expect(await STRAIGHT.decimals()).to.equal(3);
        expect(await VeSTRAIGHT.);
    });

    // it("Should transfer well", async () => {
    //     const { FUTURE, owner, addr1 } = await loadFixture(deployFUTURE);

    //     const transferAmount = ethers.parseUnits("1000", 8);
    //     await FUTURE.connect(owner).transfer(addr1.address, transferAmount);
    
    //     expect(await FUTURE.balanceOf(owner.address)).to.equal(2100_0000_0000_0000n - transferAmount);
    //     expect(await FUTURE.balanceOf(addr1.address)).to.equal(transferAmount);
    // })
})