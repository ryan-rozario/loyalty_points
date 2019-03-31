var LoyaltyToken = artifacts.require("loyalty_points");


contract('LoyaltyToken', (accounts) =>{
	var cretorAddress = accounts[0];
	var firstOwnerAddress = accounts[1];
	var secondOwnerAddress = accounts[2];
	var externalAddress = accounts[3];

	it('should revert the transaction of addOwner when an invalid address calls it', () => {
		return LoyaltyToken.deployed()
			.then(instance => {
				return instance.regBusiness("name1","email1", {from:externalAddress});
			})
      		.then(result => {
        		assert.fail();
			})
			.catch(error => {
        assert.notEqual(error.message, "assert.fail()", "Transaction was not reverted with an invalid address");
      });
});


});
