// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Roulette {
    uint betRed;
    uint betBlack;

    constructor() public payable {
    }

    modifier checkBet() {
        require(address(this).balance > 0, "It looks like this roulette is empty.. refer to the owner for a refill!");
        require(msg.value > 0, "An amount must be paid in order to bet!");
        require(msg.value  <= address(this).balance, "Your bet is to high, you getMaximumBet to check for the limit!");
        _;
    }

    function getMaximumBet() public view returns (uint) {
        return address(this).balance;
    }

    function betOnRed() public payable checkBet{
        betRed += msg.value;
    }

    function betOnBlack() public payable checkBet { 
        betBlack += msg.value;
    }

    function playRoulette() public {

    }

}