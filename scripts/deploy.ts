import { viem } from "hardhat";
import { vars } from "hardhat/config";

async function deploy() {
    const [fromWalletClient, toWalletClient] = await viem.getWalletClients();

}

deploy().catch(console.error)
.then((error) => {
    console.error(error);
    process.exit(0);
});