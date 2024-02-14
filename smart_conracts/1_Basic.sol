// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Basic {
    uint number;

    constructor (){
        // constructor used to add value to the state variables during initialization
        number = 10;
    }

    function retrieve() public view returns (uint){
        // use view keyword for retrieving state vaiable here is number 
        // this function unable to update numbr value
        return number;
    }

    function retrieveLocalVar() public pure returns (uint){
        // use pure keyword for retrieving state vaiable here is number 
        // this function unable to update numbr value
        uint localNum = 15;
        return localNum;
    }

    function store(uint num) public {
        number = num;
    }

    function increment(uint num) public {
        number += num;
    }
}
