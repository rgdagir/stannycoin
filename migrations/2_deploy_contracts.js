
const StannyCoin = artifacts.require("./StannyCoin.sol")
const StannyCoinCrowdsale = artifacts.require("./StannyCoinCrowdsale.sol");

module.exports = function(deployer, network, accounts) {
  // const rate = new web3.BigNumber(100);
  // const wallet = accounts[0];
  // const token = StannyCoin;
  // deployer.deploy(StannyCoinCrowdsale, 100000, wallet, token);
  deployer.deploy(StannyCoin);
}
