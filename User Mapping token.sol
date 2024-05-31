// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external {
		
// Ensure the address is not associated with an active user
        require(!users[msg.sender].isActive, "User already exists");

	// Create a new user and associate it with the msg.sender address
        
		// users[msg.sender] = User({
        //     balance: 100,
        //     isActive: true
        // });
		
		User storage newUser = users[msg.sender];
		
		newUser.balance = 100;
		newUser.isActive = true;
	}
 
	function transfer(address recipient, uint amount) external {
		require(users[msg.sender].isActive, "Sender is not active user");
		require(users[recipient].isActive, "Recipient is not acitve user");

		require(users[msg.sender].balance >= amount, "Yours balance is low");
		
		users[msg.sender].balance -= amount;
		users[recipient].balance += amount;
	} 

}
