const LoyaltyToken = artifacts.require("./loyalty_overview.sol");

module.exports = function(deployer) {
  deployer.deploy(LoyaltyToken);
};
