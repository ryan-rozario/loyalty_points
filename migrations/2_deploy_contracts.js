const LoyaltyToken = artifacts.require("./loyalty_points.sol");

module.exports = function(deployer) {
  deployer.deploy(LoyaltyToken);
};
