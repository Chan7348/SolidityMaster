import hre from "hardhat";
import * as viem from "viem";
import { vars } from "hardhat/config";
import { getBalance } from "viem/_types/actions/public/getBalance";
import { deployContract } from "@nomicfoundation/hardhat-viem/types";
import { expect } from "chai";
import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
const hre_viem = hre.viem;

describe("ERC3525GettingStarted", function(){
    async function deployGettingStartedFixture() {
        const [ owner, otherAccount ] = await hre_viem.getWalletClients();
        const GettingStarted = await hre_viem.deployContract("ERC3525GettingStarted");
        return { owner, otherAccount, GettingStarted };
    }
    describe("Deployment", function() {
        it("Should set the right owner", async function() {
            const { owner, GettingStarted } = await loadFixture(deployGettingStartedFixture);
            expect((await GettingStarted.read.owner()).toLowerCase()).to.equal(owner.account.address.toLowerCase());
        });
    })
    describe('Mintable', function() {
        describe('Validations', function() {
            it('Should revert without owner', async function() {
                const { owner, otherAccount, GettingStarted } = await loadFixture(deployGettingStartedFixture);
                const slot = 3525n;
                const value = viem.parseEther("9.5");
                await expect(await otherAccount.writeContract({
                    address: GettingStarted.address,
                    abi: GettingStarted.abi,
                    functionName: 'mint',
                    args: [owner.account.address, slot, value],
                    })).to.be.revertedWith('ERC3525GettingStarted: only owner can mint');
            })
        })
    })
});