# Lottery-Game
Using ERC720 tokens, enabled users to participate in a lottery.

## Description 📌
This project is called the lottery application, the participants will enter the lottery by sending some ether, and from one of these participants a winner will be selected randomly and he will get all the amount in the smart contract.

## Algorithm 📌
1)	The manager is the owner of the smart contract and only he can check the balance of the smart contract and start the lottery function.
2)	All the participants who want to enter the lottery can do so by sending 1 ether to the smart contract.  Upon sending the ether their addresses will be stored and they are eligible to enter the lottery.
3)	Upon sending the ether, the participants will also receive a token that indicates how many times they have sent the ether.
4)	A participant is eligible to buy more than one lottery place, but he can only send 1 ether at one time. To increase his chances of winning he can buy more spots, as his address will be more likely to get selected. As he buys more spots, he will receive more tokens which symbolizes the number of spots he has bought.
5)	The lottery game can only be started by the manager and it requires at least three participants to begin. 
6)	The winner among the participants must be generated at random, and once the winner is declared all the balance in the contract must be transferred to him. 
7)	Once a winner has been selected the lottery and the token count should get reset and a new lottery game can start

## Technology Stack📌
* Solidity
* Ganache
* Hardhat
* Ether.js
* Remix IDE

## Instructions & Information📌
1) Open [Remix IDE](https://remix.ethereum.org).
2) Create a new folder.
3) Inside the folder, create a solidity file with extension [.sol].
4) Copy paste code from github to the newly created .sol file.
5) Start Ganache.
6) Select Quickstart Ethereum option.
7) In Remix, select DEPLOY & RUN TRANSACTIONS.
8) In Environment dropdown, select Dev - Ganache Provider.
9) In Ganache JSON-RPC Endpoint, enter ganache rpc server. You will find rpc server details in ganache.
10) Compile & Deploy the code in remix.

