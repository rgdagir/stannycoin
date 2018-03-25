const StannyCoin = artifacts.require("./StannyCoin.sol")

module.exports = function(deployer, network, accounts) {
  deployer.deploy(StannyCoin);  // test deployment of token
}
