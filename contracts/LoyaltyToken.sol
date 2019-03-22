pragma solidity ^0.5.0;

contract LoyaltyToken{
	//Constructor
	//Set token number of tokens
	//Read total number of tokens

	uint256 public totalSupply;

	constructor () public {
		totalSupply = 1000000;
	}
}