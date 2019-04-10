pragma solidity >=0.4.21 <0.6.0;

import "./token/ERC20/ERC20Mintable.sol";


//	@Title Loyalty Points

	///@dev Implementation of the logic of Loyalty Points. The loyalty points are ERC20 Mintable tokens

contract loyalty_points is ERC20Mintable {

	///Name of the loyalty_program
	address private owner;
	string private name;
	string private symbol;
	uint8 private decimal;

	//the creator of the contarct is the owner
	constructor(address _bAd, string memory _name, string memory _symbol, uint8 _decimal) public {
		owner = _bAd;
		name = _name;
		symbol = _symbol;
		decimal = _decimal;
	}

	//This is  complex type which will be used to identify a customer


	//This is  complex type which will be used to identify a business



	///each address is mapped to a specific customer or business


    /**
     * @dev Registers a new customer
     * @param _firstName first name of customer
     * @param _lastName last name of customer
     * @param _email email of customer
     */




	   /**
     * @dev Registers a new business
     * @param _bName  name of business
     * @param _email email of business
     */



    /**
     * @dev Credit points to a customers account. This function can only be invoked by a business
     * Emits an transfer event.
     * @param _points Points to be transfered
     * @param _cAd Address of Customer
     */


/**
     * @dev Redeem points. Points are transfered from the customer to the business. This function can only be invoked by a customer
     * Emits an transfer event.
     * @param _points Points to be transfered
     * @param _bAd Address of Business
     */

	}
}