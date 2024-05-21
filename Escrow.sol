// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint256);

    constructor(address _arbiter, address _beneficiary) payable {
        
        depositor = msg.sender;//address of deployer this Contract
        arbiter = _arbiter;
        beneficiary = _beneficiary; 
    }

    function approve()  external {
        //only arbiter can Call this function
        if(msg.sender != arbiter){
            revert();
        }
        (bool success,) = beneficiary.call{value: address(this).balance}("");
        require(success);

        // emiting event for servers and frontend balanced transfer to beneficiary
        emit Approved(beneficiary.balance);
    }
}
