// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

struct Student {
    uint roll_no;
    string name;
}

contract StructDemo {
    Student public student_1;
    
    constructor(uint _roll_no, string memory _name){
        student_1.roll_no = _roll_no;
        student_1.name = _name;
    }

    function changeValue(uint _roll_no, string memory _name) public {
        Student memory new_student = Student({
            roll_no: _roll_no,
            name: _name
        });

        student_1 = new_student; 
    }
}
