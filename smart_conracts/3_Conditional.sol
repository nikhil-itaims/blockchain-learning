// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Conditional {
    function checkVal(int num) public pure returns(string memory) {
        // Meaning of memory in returns(string memory)
        // Storage: Permanent state, persists between function calls.
        // Memory: Temporary space, allocated during function execution, disappears after the function returns.
        // Calldata: Function input data, read-only, cannot be modified.
        string memory value;

        if(num > 0) {
            value = "Number is positive.";
        }

        else if(num < 0) {
            value = "Number is negative.";
        }

        else{
            value = "Number is zero.";
        }
        return value;
    }
}
