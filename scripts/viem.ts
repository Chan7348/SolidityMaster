import hre from "hardhat";
import * as viem from "viem";
import { vars } from "hardhat/config";
import { getBalance } from "viem/_types/actions/public/getBalance";
import { deployContract } from "@nomicfoundation/hardhat-viem/types";
const hre_viem = hre.viem;

async function main(){
    // set of public client
    const publicClient = await hre_viem.getPublicClient();
    // set of wallet client
    const [ test1, test2 ] = await hre_viem.getWalletClients();
    const addressOfTest1 = test1.account.address;
    console.log(`Address of test1: ${addressOfTest1}`);
    const balanceOfTest1 = await publicClient.getBalance({address: addressOfTest1});
    console.log(`Balance of test1: ${viem.formatEther(balanceOfTest1)}`);
    const addressOfTest2 = test2.account.address;
    console.log(`Address of test2: ${addressOfTest2}`);
    const balanceOfTest2 = await publicClient.getBalance({address: addressOfTest2});
    console.log(`Balance of test2: ${viem.formatEther(balanceOfTest2)}`);

    // self test
    // const receiver = await hre_viem.deployContract("Receiver"); // 0xfae954e4f223ac1e2cc7437563dbb5b2e2a3fb9e
    // console.log(`Contract address: ${receiver.address}`);

    // const Caller = await hre_viem.deployContract("Caller");
    // console.log(`Caller address: ${Caller.address}`);

    // const receiverAddress:viem.Address = "0xfae954e4f223ac1e2cc7437563dbb5b2e2a3fb9e"; 
    // await Caller.write.testCallFoo([receiverAddress]);
    // const logs = await publicClient.getContractEvents({address: Caller.address});
    // const erc3525 = await hre_viem.deployContract("ERC3525GettingStarted");
    // console.log(`ERC3525GettingStarted address: ${erc3525.address}`);
    const crv = await hre_viem.deployContract("CRV", ["Curve DAO Token", "CRV", 18]);
    console.log(`CRV address: ${crv.address}`);
}

main().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});