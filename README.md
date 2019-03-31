# Blockchain based Loyalty Program

This repo contains the code for the smart contract for a decentralized loyalty system. 

## Loyalty Point Smart Contract

[Smart Contract for loyalty program](./contracts/loyalty_points.sol)

The loyalty points are Mintable ERC20 tokens based on the ERC20 standard.

There are two types of users in the loyalty points system: Businesses and Customers.

When Businesses register they are given a large number of tokens.
When customers earn coins, businesses can transfer the tokens to the customers.
When customers want to redeem the tokens, they can transfer the tokens to any business involved the loyalty program.

These transactions are stored in the blockchain as an immutable distributed ledger.

Since the loyalty tokens are ERC20 tokens they can also be converted to other crypto-tokens if support for that is provided.

The smart contract for the ERC20 tokens is based on the OpenZeppelin Library.

## Contributing
Pull requests are welcome.

## Future Work
Development of collaboration between between businesses.
Collaborations between businesses would allow for certain businesses to work together such as if they were in the same locality to provide special deals for their customers.

