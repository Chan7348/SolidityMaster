import hre from "hardhat";
import * as viem from "viem";
const hre_viem = hre.viem;

async function main(){
    const LOCK = await hre_viem.getContractAt("LOCK", "0xBE474255dC5946eB46125973AE50538b42542b77", {
        client: { wallet: await hre_viem.getWalletClient("0xbB3AF9dB7480ed8f0F296E2395ec794f23F8c748") }
    });
    // 查看合约的所有者
    const owner = await LOCK.read.getOwner();
    console.log(owner);

    const test1: viem.Address = "0xbB3AF9dB7480ed8f0F296E2395ec794f23F8c748";

    const balance1 = await LOCK.read.balanceOf([test1]);
    console.log(viem.formatUnits(balance1, 3));

}

main().catch(console.error);