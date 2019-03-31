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
	constructor(string memory _name, string memory _symbol, uint8 _decimal) public {
		owner = msg.sender;
		name = _name;
		symbol = _symbol;
		decimal = _decimal;
	}

	//This is  complex type which will be used to identify a customer

	struct Customer {
        address cusAd;
        string firstName;
        string lastName;
        string email;
        bool isReg;
	}

	//This is  complex type which will be used to identify a business

	struct Business {
        address busAd;
        string name;
        string email;
        bool isReg;

	}

	///each adress is mapped to a specific customer or business
	mapping(address => Customer) public customers;
	mapping(address => Business) public businesses;

    /**
     * @dev Registers a new customer
     * @param _firstName first name of customer
     * @param _lastName last name of customer
     * @param _email email of customer
     */


	function regCustomer(string memory _firstName, string memory _lastName, string memory _email, address _cAd) public {
		require(msg.sender == owner);
		require(!customers[_cAd].isReg, "Customer Registered");
		require(!businesses[_cAd].isReg, "Business Registered");
		customers[_cAd] = Customer(_cAd, _firstName, _lastName, _email, true);

	}

	   /**
     * @dev Registers a new business
     * @param _bName  name of business
     * @param _email email of business
     */

	function regBusiness(string memory _bName, string memory _email, address _bAd) public {
		require(msg.sender == owner);
		require(!customers[_bAd].isReg, "Customer Registered");
		require(!businesses[_bAd].isReg, "Business Registered");
		businesses[_bAd] = Business(_bAd, _bName , _email, true);
		mint(_bAd, 10000);

	}

    /**
     * @dev Credit points to a customers account. This function can only be invoked by a business
     * Emits an transfer event.
     * @param _points Points to be transfered
     * @param _cAd Address of Customer
     */

	function putPoints (uint256 _points, address _cAd ) public {
		//Check if sender is a business and reciever is a customer
		require(customers[_cAd].isReg, "This is not a valid customer account");
		require(businesses[msg.sender].isReg, "This is not a valid business account");

		transferFrom(msg.sender, _cAd, _points);
	}

/**
     * @dev Redeem points. Points are transfered from the customer to the business. This function can only be invoked by a customer
     * Emits an transfer event.
     * @param _points Points to be transfered
     * @param _bAd Address of Business
     */

	function spendPoints (uint256 _points, address _bAd ) public{
		//Check if sender is a customer and reciever is a business
		require(customers[msg.sender].isReg, "This is not a valid customer account");
		require(businesses[_bAd].isReg, "This is not a valid business account");
		transferFrom(msg.sender, _bAd, _points);
	}
}