// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract CurrencyExchange {

  mapping(address => uint256) balancesUSD;
  mapping(address => uint256) balancesEUR;

  uint256 constant USD_PRICE = 0.0005 ether;
  uint256 constant EUR_PRICE = 0.0006 ether;

  constructor() public payable {
  }


  function buyEUR(uint256 numEUR) public payable {
    require(msg.value == numEUR * EUR_PRICE, "Ether amount doesn't match sale price");
    balancesEUR[msg.sender] += numEUR;
  }

  function buyUSD(uint256 numUSD) public payable {
      require(msg.value == numUSD * USD_PRICE, "Ether amount doesn't match sale price");
      balancesUSD[msg.sender] += numUSD;
  }

  function sellEUR(uint256 numEUR) public payable {
    require(balancesEUR[msg.sender] >= numEUR, "You don't have enough EUR to sell!");
    balancesEUR[msg.sender] += numEUR;
  }

  function sellUSD(uint256 numUSD) public payable {
      require(balancesUSD[msg.sender] >= numUSD , "You don't have enough USD to sell!");
      balancesUSD[msg.sender] += numUSD;
  }

  function convertEURtoUSD(uint256 amount) public {
    require(balancesEUR[msg.sender] >= 0, "You don't have enough EUR to change!");
    balancesEUR[msg.sender] -= amount;
    balancesUSD[msg.sender] += (USD_PRICE / EUR_PRICE) * amount;      
  }

  function convertUSDtoEUR(uint256 amount) public {
    require(balancesUSD[msg.sender] >= 0, "You don't have enough USD to change!");
    balancesUSD[msg.sender] -= amount;
    balancesEUR[msg.sender] += (EUR_PRICE / USD_PRICE) * amount;
  }

  function getUSDbalance(address _owner) public view returns (uint balance) {
    return balancesUSD[_owner];
  }

  function getEURbalance(address _owner) public view returns (uint balance) {
    return balancesEUR[_owner];
  }
}