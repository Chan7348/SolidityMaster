import { getContract } from 'viem';
import { viem } from "hardhat";
import { vars } from "hardhat/config";

async function deploy() {
    const CRV = await viem.deployContract("CRV",  ["CRV", "CRV", 18]);
}

deploy().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});