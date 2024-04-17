import { VeSTRAIGHT } from './../typechain-types/contracts/week4/VeSTRAIGHT.sol/VeSTRAIGHT';
import { VeSTRAIGHT__factory } from './../typechain-types/factories/contracts/week4/VeSTRAIGHT.sol/VeSTRAIGHT__factory';
import { STRAIGHT } from './../typechain-types/contracts/week4/STRAIGHT.sol/STRAIGHT';
// import { FUTURE } from './../typechain-types/FUTURE';
// import { WETH } from './../typechain-types/WETH';
// import { Signer } from "ethers";
import { ethers } from "hardhat";
import { vars } from "hardhat/config";

async function main() {
  // const Wallet = await ethers.deployContract("Wallet", [[vars.get("TEST1_ACCOUNT"), vars.get("TEST2_ACCOUNT")], 2]);

  // await Wallet.waitForDeployment();

  // const STRAIGHT_factory = await ethers.getContractFactory("STRAIGHT");

  // const STRAIGHT = await STRAIGHT_factory.deploy();

  // console.log(
  //   `deployed to ${ await STRAIGHT.getAddress()}`
  // );

  const VeSTRAIGHT__factory = await ethers.getContractFactory("VeSTRAIGHT");

  const VeSTRAIGHT = await VeSTRAIGHT__factory.deploy("0x5039a61aDFDce40A0443C32C3658895f813F5e32");

  console.log(
    `deployed to ${ await VeSTRAIGHT.getAddress()}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
