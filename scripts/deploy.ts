import { getContract } from 'viem';
import { viem } from "hardhat";
import { vars } from "hardhat/config";

async function deploy() {
    const factory = await viem.getContractAt('CREATEfactory', "0xf7b2d79540debdcb3aaffd822168e2e67e0f829e");
    console.log(`name: ${await factory.read.name()}`);
    console.log(`create Create at: ${await factory.write.createCreate(["蔡徐坤"])}`);
}

deploy().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});