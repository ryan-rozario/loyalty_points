pragma solidity >=0.4.21 <0.6.0;


import "./loyalty_points.sol";


contract loyalty_overview {

	address private owner;

	constructor(string memory _name, string memory _symbol, uint8 _decimal) public {
		owner = msg.sender;
	}

	//This is  complex type which will be used to identify a customer

	struct Customer {
        address cusAd;
        string firstName;
        string lastName;
        string email;
        bool isReg;
        mapping(address => bool) bus;
        mapping(address => address) cont;


	}

	//This is  complex type which will be used to identify a business

	struct Business {
        address busAd;
        string name;
        string email;
        bool isReg;
        loyalty_points lt;
        mapping(address => bool) cus;
        mapping(address => bool) bs;
        mapping(address => uint256) rate;
	}

	///each address is mapped to a specific customer or business
	mapping(address => Customer) public customers;
	mapping(address => Business) public businesses;

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

	function regBusiness(string memory _bName, string memory _email, address _bAd, string memory _symbol, uint8 _decimal) public {
		require(msg.sender == owner);
		require(!customers[_bAd].isReg, "Customer Registered");
		require(!businesses[_bAd].isReg, "Business Registered");
		loyalty_points _newcon = new loyalty_points(_bAd, _bName, _symbol, _decimal);
		businesses[_bAd] = Business(_bAd, _bName , _email, true, _newcon);
		businesses[_bAd].lt.mint(_bAd, 10000);

	}
    
    
    
	function regCustomer(string memory _firstName, string memory _lastName, string memory _email, address _cAd) public {
		require(msg.sender == owner);
		require(!customers[_cAd].isReg, "Customer Registered");
		require(!businesses[_cAd].isReg, "Business Registered");
		customers[_cAd] = Customer(_cAd, _firstName, _lastName, _email, true);
	}

	function joinBusiness(address _bAd) public{
		require(customers[msg.sender].isReg, "This is not a valid customer account");
		require(businesses[_bAd].isReg, "This is not a valid business account");
		businesses[_bAd].cus[msg.sender] = true;
		customers[msg.sender].bus[_bAd] = true;
	}

	function connectBusiness(address _bAd, uint256 _rate) public{
		require(businesses[_bAd].isReg, "This is not a valid business account");
		require(businesses[msg.sender].isReg, "This is not a valid business account");
		businesses[msg.sender].bs[_bAd] = true;
		businesses[msg.sender].rate[_bAd] = _rate;


	}


	function spend(address from_bus, address to_bus, uint256 _points) public {
		require(customers[msg.sender].isReg, "This is not a valid customer account");
		require(businesses[from_bus].isReg, "This is not a valid business account");
		require(businesses[to_bus].isReg, "This is not a valid business account");
		if(from_bus==to_bus){
			businesses[to_bus].lt.transferFrom(msg.sender, to_bus, _points);
		}
		else{
			require(businesses[from_bus].bs[to_bus], "This is not a valid linked business account");
			require(businesses[to_bus].bs[from_bus], "This is not a valid linked business account");
			uint256 _r = businesses[from_bus].rate[to_bus];
			businesses[from_bus].lt.burnFrom(msg.sender, _points);
			businesses[to_bus].lt.mint(to_bus, _r*_points);

		}


	}

	function reward(address _cAd, uint256 _points) public{
		require(businesses[msg.sender].isReg, "This is not a valid business account");
		require(customers[_cAd].isReg, "This is not a valid customer account");
		require(businesses[msg.sender].cus[_cAd], "This customer has not joined your business" );
		require(customers[_cAd].bus[msg.sender], "This customer has not joined your business" );
		businesses[msg.sender].lt.transferFrom(msg.sender, _cAd, _points);
	}




}