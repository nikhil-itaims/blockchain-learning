// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Array {
    uint[] public arr;

    constructor (){
        arr = [11, 12, 13];
    }

    function pushElement(uint item) public{
        arr.push(item);
    }

    function popElement() public{
        arr.pop();
    }

    function getArrayLength()  public view returns (uint){
        return arr.length;
    }
}
