// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Roulette.sol";

contract Attack {
    Roulette rt;

    constructor (address payable _addr) public payable {
        rt = Roulette(_addr);

    }
}