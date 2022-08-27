// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract CurrencyExchange {

  mapping(address => uint256) balancesUSD;
  mapping(address => uint256) balancesEUR;

    uint256 constant USD_PRICE = 0.0005 ether;
    uint256 constant EUR_PRICE = 0.0006 ether;

  constructor() public payable {
  }

  modifier validCurrencies() {
      _;
  }

  function buyEUR(uint256 numEUR) public payable {
    require(msg.value == numEUR * EUR_PRICE, "Ether amount doesn't match sale price");
    balancesEUR[msg.sender] += numEUR;
  }

  function buyUSD(uint256 numUSD) public payable {
      require(msg.value == numUSD * USD_PRICE, "Ether amount doesn't match sale price");
          balancesUSD[msg.sender] += numUSD;
  }

  function exchange(uint256 sell, uint256 buy, uint256 amount) validCurrencies public {
  }

  function getUSDbalance(address _owner) public view returns (uint balance) {
    return balancesUSD[_owner];
  }

  function getEURbalance(address _owner) public view returns (uint balance) {
    return balancesEUR[_owner];
  }
}