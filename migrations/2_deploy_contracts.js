const LoyaltyToken = artifacts.require("LoyaltyToken");

module.exports = function(deployer) {
  deployer.deploy(LoyaltyToken);
};
