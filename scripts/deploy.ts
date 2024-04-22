import { viem } from "hardhat";
import { vars } from "hardhat/config";

async function deploy() {
    await viem.deployContract("ForTest");
}

deploy().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});