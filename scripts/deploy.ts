import { getContract } from 'viem';
import { viem } from "hardhat";
import { vars } from "hardhat/config";

async function deploy() {
    const WBTC = await viem.deployContract("")
}

deploy().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});