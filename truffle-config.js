const HDWalletProvider = require('truffle-hdwallet-provider');
const fs = require('fs');
module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    },
    nira: {
      network_id: "*",
      gas: 0,
      gasPrice: 0,
      provider: new HDWalletProvider(fs.readFileSync('/Users/davinderkumar/Erlebnisse/my_mnemonic.env', 'utf-8'), "https://raghavarora.blockchain.azure.com:3200/Aa69uw4oKY8cJR-maCHnRqsR"),
      consortium_id: 1565510874304
    }
  },
  mocha: {},
  compilers: {
    solc: {
      version: "0.5.0"
    }
  }
};
