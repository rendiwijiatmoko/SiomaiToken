const HDWalletProvider = require('@truffle/hdwallet-provider');
const fs = require('fs');
const mnemonic = fs.readFileSync(".secret").toString().trim();

const provider = new HDWalletProvider({
  privateKeys:[mnemonic],
  providerOrUrl:'https://data-seed-prebsc-1-s1.binance.org:8545/'
})

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,      
      network_id: "*",
    },
    testnet: {
      provider: () => provider,
      network_id: "97",
      confirmations: 10,
    }
  },
  mocha: {
    // timeout: 100000
  },

  compilers: {
    solc: {
    }
  }
}