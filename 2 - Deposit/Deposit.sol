pragma solidity ^0.5.0;

contract Deposit {
    uint balance;
    address payer;

    constructor() public payable {
        payer = tx.origin;
        balance += msg.value;
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
        balance += msg.value;
    }

    function withdraw(uint amount) public notOwner {
        require (balance >= amount);
        balance -= amount;
        msg.sender.transfer(address(this).balance);
    }

    function getBalance() public view returns (uint) {
        return balance;
    }

    function debugTX() public view returns (address) { return tx.origin; }
    function debugMSG() public view returns (address) { return msg.sender; }
}



