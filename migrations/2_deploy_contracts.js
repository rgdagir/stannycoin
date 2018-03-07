const StannyCoin = artifacts.require("./StannyCoin.sol")
const StannyCoinCrowdsale = artifacts.require("./StannyCoinCrowdsale.sol");

module.exports = function(deployer, network, accounts) {
  const rate = new web3.BigNumber(1000);
  const wallet = accounts[0];
  const token = StannyCoin;
  deployer.deploy(StannyCoinCrowdsale, rate, wallet, token);
}
