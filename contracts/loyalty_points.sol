pragma solidity >=0.4.21 <0.6.0;

import "./token/ERC20/ERC20Mintable.sol";


//	@Title Loyalty Points

	///@dev Implementation of the Loyalty Tokens. The loyalty points are ERC20 Mintable tokens

contract loyalty_points is ERC20Mintable {

	///Name of the loyalty_program of business
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
}