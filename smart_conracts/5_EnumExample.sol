// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract EnumExample {
    // creating an enum
    enum Button {
        ON,
        OFF
    }

    // declaring a variable of type enum
    Button button;

    // function to turn on the button
    function buttonOn() public {
        // set the value of button to ON
        button = Button.ON;
    }

    // function to turn off the button
    function buttonOff() public {
        // set the value of button to OFF
        button = Button.OFF;
    }

    // function to get the value of the button
    function getbuttonState() public view returns (Button) {
        // return the value of button
        return button;
    }
}
