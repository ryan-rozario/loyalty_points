# Blockchain based Loyalty Program

This repo contains the code for the smart contract for a decentralized loyalty system. 

## Loyalty Point Smart Contract



The loyalty points are Mintable ERC20 tokens based on the ERC20 standard.
Each retailer has his own crypto-token .

Contracts Implemented by me:

1. Loyalty Overview controls the whole rewards system. It keeps a track of businesses and customers and controls transactions between them. The core functionality of the program is in this smart contract.
[Smart Contract for loyalty program](./contracts/loyalty_overview.sol)

2. Loyalty Points is a ERC20Mintable token that can be used to organise the structure of each loyalty token and to build additional functionality to be built into the loyalty token. Not much additional functionality is implemented for the base ERC20 token itself.
[Smart Contract for loyalty token](./contracts/loyalty_points.sol)

There are two types of users in the loyalty points system: Businesses and Customers.

When Businesses register they are given their own crypto-token that represents the rewards for that retailor. Each retailer can mint more tokens if need be.
Businesses can allow other businesses to use their tokens if they both come to an agreement about a conversion rate. Thus mutually beneficial rewards systems can be set up. Customers can redeem tokens earned at a particualar store at another store provided both businesses reach an agreement.
When customers earn coins, businesses can transfer the tokens to the customers.
When customers want to redeem the tokens, they can transfer the tokens to any business involved the loyalty program.

I have NOT allowed customers to exchange tokens among themselves as it would not benefit the businesses.

These transactions are stored in the blockchain as an immutable distributed ledger.

Since the loyalty tokens are ERC20 tokens they can also be converted to other crypto-tokens if support for that is provided.

Smart Contracts that are not implemented by me:
All smart contracts related to the Mintable ERC20 Token implementation are taken from the [OpenZeppelin Library](https://github.com/OpenZeppelin/openzeppelin-solidity). All contracts in the access, token and math folder are not implemented by me. These are taken from the OpenZeppelin Library. This is done as ERC20 is a standard for which OpenZeppelin provides a commonly used implementation. Simply implementing this would be reinventing the wheel. Since the OpenZeppelin implementation provides a uniform implementation across several contracts, it becomes easier in the future to link our loyalty token with other crypto-tokens. 

## Frameworks


Use Ganche: a fast and customizable blockchain emulator.

```bash
ganache-cli
```

The Truffe framework is used
```bash
truffle 
```

## Testing

Tests:

1. Test if the contract is initialized correctly

2. Register customers and businesses.
	1. Make each business has their own crypto-tokens and they are initialized properly
	2. Make sure the customers and businesses are registered properly.

3. Transactions
	1. Make sure a businesses and give loyalty points to a customer
	2. Make sure a customer can redeem loyalty points at the same business
	3. Make sure a customer can redemem loyalty points at a different business with whom the original business has an understanding

4. Permission
	1. Make sure a customer cant give themselves tokens and can trade within themselves
	2. Make sure customers cant use tokens at stores where there is no deal arranged between the businesses
	3. Basically make sure that all the require conditions in the code are satisfied and sufficient for proper functioning of the system.



