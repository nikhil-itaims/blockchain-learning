// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract MappingExample {
    mapping(uint => string) public roll_number; 

    constructor() {
        roll_number[1] = "Nikhil Sutariya";
    }

    function setUser(uint key, string memory student_name) public {
        roll_number[key] = student_name;
    }
}

contract AdvanceMappingExample {
    // Mapping type with struct
    struct Student {
        uint class;
        string name;
    }

    mapping(uint => Student) public student_data; 

    constructor() {
        student_data[1] = Student({
            class: 8,
            name: "Nikhil Sutariya"
        });
    }

    function setUser(uint roll_number, uint class, string memory student_name) public {
        student_data[roll_number] = Student(class,student_name);
    }
}
