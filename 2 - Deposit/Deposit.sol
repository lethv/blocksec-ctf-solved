// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Deposit {
    uint private vault;
    address public payer;

    constructor() public {
        payer = tx.origin;
    }

    modifier checkOwnership() {
        require(payer == msg.sender, "Only the owner can deposit");
        _;
    }

    modifier notOwner() {
        require(payer != msg.sender, "Payer can't collect the payment");
        _;
    }

    function deposit() public payable checkOwnership {
        vault += msg.value;
    }

    function withdraw(uint amount) public notOwner {
        require (vault >= amount);
        vault -= (amount * 1e18);
        msg.sender.transfer(amount * 1e18);
    }

    function getBalance() public view returns (uint) {
        return vault;
    }

    function getPayer() public view returns (address) {
        return payer;
    }
}



