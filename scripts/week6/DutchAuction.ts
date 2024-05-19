import {viem} from 'hardhat';

async function deploy() {
    const DutchAuction = viem.deployContract("DutchAuction");
    console.log(`DutchAuction address: ${(await DutchAuction).address}`);
}

deploy().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});