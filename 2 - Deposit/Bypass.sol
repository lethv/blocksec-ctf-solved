pragma solidity ^0.5.0;
import "./Deposit.sol";


contract Bypass {
    address oaddr;
    constructor(address _addr) public payable {
        oaddr = _addr;
    }

    function withdraw(uint _amount) public payable {
        Deposit c = Deposit(oaddr);   
        c.withdraw(_amount);
    }

    function debugTX() public view returns (address) {
        Deposit c = Deposit(oaddr);   
        return c.debugTX();
    }

    function debugMSG() public view returns (address) {
        Deposit c = Deposit(oaddr);   
        return c.debugMSG();
    }
}