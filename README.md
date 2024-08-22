# Project Title

DEGEN Token Contract

## Description

This is an ERC20 token contract, It allows creation of tokens, where the contract owner only has the ability to mint, any user can transfer and burn the token

    - State: Owner state, storing the contract owner address
    - Modifier: Utilizes 2 modifiers, onlyOwner and hasTokens modifiers, onlyOwner modifier checks the msg.sender is the owner of the contract and hasToken Modifier checks whether the address has enough token
    - Functions: the contract include function for mininting, transfering and burning of the token


## Getting Started

### Executing program
    - clone the project from github
    - cd "project director"
    - To deploy, run: npx hardhat run --network fuji .\scripts\deploy.js
    - To verify contract, run: npx hardhat verify --network fuji "contract address"


    For ease in executing the smart contract, the address can be copied and use in remix environment to interact with different functions in the contract

## Authors

Contributors names and contact info

ex. toyin 


## License

This project is licensed under the MIT License 

## Address
0xfB5a4818beBfD627d6a61618dbb1BD861C432403