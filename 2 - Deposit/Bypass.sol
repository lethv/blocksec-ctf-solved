// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Deposit.sol";


contract Bypass {
    Deposit depos;

    constructor(address _addr) public {
        depos = Deposit(_addr);
    }

    function withdraw(uint _amount) public {
        depos.withdraw(_amount);
    }

    function getBalance() public view returns (uint) {
    return address(this).balance;
    }

    receive() external payable{
    }
}