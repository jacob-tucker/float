import {config} from "@samatech/onflow-fcl-esm";

config({
  "accessNode.api": import.meta.env.VITE_ACCESS_NODE_API,
  "discovery.wallet": import.meta.env.VITE_DISCOVERY_WALLET,
  "0xFLOAT": import.meta.env.VITE_FLOAT_ADDRESS,
  "0xFMDV": import.meta.env.VITE_FLOAT_ADDRESS,
  "0xNFT": import.meta.env.VITE_CORE_CONTRACTS_ADDRESS,
  "0xMDV": import.meta.env.VITE_CORE_CONTRACTS_ADDRESS,
})