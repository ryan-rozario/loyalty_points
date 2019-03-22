var LoyaltyToken = artifacts.require("LoyaltyToken");

contract('LoyaltyToken' , function(accounts){

	it('sets the total upon deployment', function(){
		return LoyaltyToken.deployed().then(function(instance){
			tokenInstance = instance;
			return tokenInstance.totalSupply();
		}).then(function(totalSupply){
			assert.equal(totalSupply.toNumber(), 1000000, 'set the total supply to 1000000');
		});
	});
})