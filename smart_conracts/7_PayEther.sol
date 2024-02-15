// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract PayEther {
    address payable user = payable(address here);
    
    function pay() public payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function payToAccount(uint amount) public{
        uint etherAmt = amount * 10**18; // To convert amount wei to ether
        user.transfer(etherAmt);
    }
}
