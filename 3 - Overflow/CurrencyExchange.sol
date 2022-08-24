pragma solidity ^0.5.0


contract CurrencyExchange {

  mapping(address => uint) balancesUSD;
  mapping(address => uint) balancesEUR;

    uint256 constant USD_PRICE = 0.000595702 ether;
    uint256 constant EUR_PRICE = 0.000620529 ether;

  constructor() public payable {
  }

  modifier validCurrencies() {
      _;
  }

  function buyEUR(uint256 numEUR) public payable {
    require(msg.value == numEUR * EUR_PRICE);
    balancesEUR[msg.sender] += numEUR;
  }

  function buyUSD(uint256 numUSD) public payable {
      require(msg.value == numUSD * USD_PRICE);
          balancesUSD[msg.sender] += numUSD;
  }

  function exchange(uint256 sell, uint buy, uint256 amount) validCurrencies public {
  }

  function getUSDbalance(address _owner) public constant returns (uint balance) {
    return balancesUSD[_owner];
  }

  function getEURbalance(address _owner) public constant returns (uint balance) {
    return balancesEUR[_owner];
  }
}