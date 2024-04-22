import { HardhatUserConfig, vars } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";
import "@nomicfoundation/hardhat-viem";
import "@nomicfoundation/hardhat-foundry";
const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.24",
    settings: {
      evmVersion: "cancun",
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
  defaultNetwork: 'hardhat',
  networks: {
    hardhat: {
      forking: {
        // url: vars.get("MAINNET_INFURA_URL") || "",
        // url: vars.get("MAINNET_ALCHEMY_URL") || "",
        // url: "https://rpc.merlinchain.io", // merlin 
        // url: "https://arb-sepolia.g.alchemy.com/v2/a1Z6RxI8nUQLxzzNnYDbDkSzwZYpsmHU", //arbitrum sepolia
        url: "https://eth-sepolia.g.alchemy.com/v2/7dg61Re-J49kkBk9urxJIBwCRaVQcWq8", //sepolia
        // blockNumber: 19532800,
        // blockNumber: 5634369,
      },
      blockGasLimit: 60000000,
      // hardfork: "cancun",
    },
    arbitrum_sepolia: {
      url: "https://arb-sepolia.g.alchemy.com/v2/a1Z6RxI8nUQLxzzNnYDbDkSzwZYpsmHU" || "",
      accounts: [vars.get("TEST1_KEY"), vars.get("TEST2_KEY")],
    },
    sepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/7dg61Re-J49kkBk9urxJIBwCRaVQcWq8" || "",
      accounts: [vars.get("TEST1_KEY"), vars.get("TEST2_KEY")],
    }
  },
  sourcify: {
    enabled: true,
  },
  etherscan: {
    apiKey: {
      arbitrumSepolia: 'IQWAAF48I9BVSMJA8BIVEGM8Z55DZXTBSD',
      sepolia: 'VK61M4154HUEBDRPEUZXF3MW2J7GSK9WJW'
    }
  }
};

export default config;
