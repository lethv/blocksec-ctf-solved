// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract TokenSale {

    uint256 constant TOKEN_PRICE = 1 ether;
    mapping(address => uint) public balances;

    constructor() public {
    }

    function buyTokens(uint amount) public payable {
        require(msg.value == amount * TOKEN_PRICE, "Ether amount doesn't match sale price");
        balances[msg.sender] += amount;
    }

    function sellTokens(uint amount) public {
        require(balances[msg.sender] >= amount);

        (bool sent, ) = msg.sender.call{value: (amount * 1000000000000000000)}("");
        require(sent, "Sale has failed, pleased try again!");

        balances[msg.sender] -= amount;
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    function getCBalance() public view returns (uint) {
        return address(this).balance;
    }

    
}