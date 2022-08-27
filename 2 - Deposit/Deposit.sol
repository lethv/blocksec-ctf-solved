// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Deposit {
    uint private vault;
    address private payer;

    constructor() public {
        payer = tx.origin;
    }

    modifier checkOwnership() {
        require(payer == msg.sender, "Only the owner can deposit");
        _;
    }

    modifier notOwner() {
        require(tx.origin != msg.sender, "Payer can't collect the payment");
        _;
    }

    function deposit() public payable checkOwnership {
        vault += msg.value;
    }

    function withdraw(uint amount) public notOwner {
        require (vault >= amount);
        vault -= amount;
        msg.sender.transfer(amount);
    }

    function getBalance() public view returns (uint) {
        return vault;
    }
}



