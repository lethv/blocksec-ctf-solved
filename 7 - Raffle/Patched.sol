// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Raffle {
    mapping(address => uint) ticketsNumbers;
    mapping(uint => bool) ticketsBought;

    address organizer;

    uint rafflePrize;
    uint TICKET_PRIZE = 1 ether;
    uint cn;
    bool isFinished;

    modifier onlyOrganizer() {
        require(organizer == msg.sender, "Only organizer can finish de raffle!");
        _;
    }

    modifier checkFinished() {
        require(isFinished, "Raffle hasn't finished yet!");
        _;
    }

    modifier checkNotFinished() {
        require(!isFinished, "Raffle has already finished!");
        _;
    }

    modifier winningPlayer() {
        require(ticketsNumbers[msg.sender] == cn, "It looks like you're not the winning player this time.. good look on the next ones!");
        _;
    }

    modifier notPlayed() {
        require(ticketsNumbers[msg.sender] > 0, "You can buy only 1 ticket per raffle!");
        _;
    }

    modifier humanPlayer() {
        require(!isContract(msg.sender), "Only humans can play the roulette!");
        _;
    }

    function isContract(address _addr) private view returns (bool answer){
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }

    constructor() public payable {
        require(msg.value >= 15 ether, "You should fund the contract to pay the winners!");
        organizer = msg.sender;
        rafflePrize =  15 ether;
        isFinished = false;
    }

    function buyRafflewTicket(uint number) public payable checkNotFinished humanPlayer {
        require(msg.value == TICKET_PRIZE, "Ticket price is exactly 1 ether");
        require(number > 0 && number <= 20, "The number you can bid on must be between 1 and 20!");
        require(ticketsBought[number] != true, "This number has been already bought!");

        ticketsBought[number] = true;
        ticketsNumbers[msg.sender] = number;
    }

    function finishRaffle() public checkNotFinished onlyOrganizer {
        isFinished = true;
        cn = uint256(keccak256(abi.encodePacked(block.number - 8, now))) % 19 + 1;
    }

    function getWinningNumber() public view checkFinished returns (uint) {
        return cn;
    }

    function getRafflePrize() public view returns (uint) {
        return rafflePrize;
    }

    function redeemPrize() public checkFinished winningPlayer {
        msg.sender.transfer(rafflePrize);
    }

    // Revert transaction if something fails
    fallback() external {
        revert();
    }
}