import { FUTURE } from './../typechain-types/FUTURE';
import { expect } from "chai";
import { ethers } from "hardhat";
import { loadFixture, time } from "@nomicfoundation/hardhat-toolbox/network-helpers";

const name = "future token"
const symbol = "FUTURE"

describe("FUTURE", () => {// name of the contract
    async function deployFUTURE() {
        const FUTURE__factory = await ethers.getContractFactory("FUTURE");
        const FUTURE = await FUTURE__factory.deploy();
        const [ owner, addr1, addr2 ] = await ethers.getSigners();
        await FUTURE.waitForDeployment();
        
        return { FUTURE, owner, addr1, addr2 };
    }
    

    it("Should init correctly", async () => {
        const { FUTURE, owner} = await loadFixture(deployFUTURE);
        expect(await FUTURE.balanceOf(owner.address)).to.equal(2100000000000000);
        expect(await FUTURE.name()).to.equal(name);
        expect(await FUTURE.symbol()).to.equal(symbol);
        expect(await FUTURE.decimals()).to.equal(8);
    });

    it("Should transfer well", async () => {
        const { FUTURE, owner, addr1 } = await loadFixture(deployFUTURE);

        const transferAmount = ethers.parseUnits("1000", 8);
        await FUTURE.connect(owner).transfer(addr1.address, transferAmount);
    
        expect(await FUTURE.balanceOf(owner.address)).to.equal(2100_0000_0000_0000n - transferAmount);
        expect(await FUTURE.balanceOf(addr1.address)).to.equal(transferAmount);
    })
})