// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Auction {
    address payable public organizer;

    address public highestBidder;
    uint public highestBid;

    mapping(address => uint) bids;
    bool finished;

    constructor() public {
        organizer = msg.sender;
        finished = false;
    }

    modifier onlyOrganizer() {
        require(organizer == msg.sender, "Only the organizer can finish the auction");
        _;
    }

    function bid() public payable {
        require (msg.value > highestBid, "You must beat the highest bid!");

        bids[highestBidder] += highestBid;
        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    function finishAuction() public onlyOrganizer {
        require(!finished, "Auction has already finished!");
        finished = true;
    }

    function withdrawHighestBid() public onlyOrganizer returns (bool) {
        require(finished, "Auction has not finished yet!");
        
        finished = true;

        if (highestBid > 0) {
            uint toSend = highestBid;
            highestBid = 0;

            if (!organizer.send(toSend)) {
                highestBid = 0; // Restore value
                return false;
            }  
        }
        return true;
    }

    function withdrawBid() public returns (bool) {
        uint toRet = bids[msg.sender];
        if (toRet > 0) {
            bids[msg.sender] == 0;

            if (!msg.sender.send(toRet)) {
                bids[msg.sender] = toRet; // Restore value
                return false;
            }   
        }
        return true;
    }

    // Finish auction if something fails
    receive() external payable{
        finished = true;
    }

}

