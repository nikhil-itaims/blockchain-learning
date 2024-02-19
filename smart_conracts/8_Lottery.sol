// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Lottery {
    /* 
        Simple smart contract for lottery game.
        Participants has to transfer 2 ether to participate the lottery and minimum 3 participants are required to dicide result.
        Only lottery manager can view the balance and select the winner. 
        Winner receives all the ethers in balance.
    */

    address public manager;
    address payable[] public participants;

    constructor() {
        manager = msg.sender;
    }
    
    receive() external payable {
        require(msg.value == 2 ether);
        participants.push(payable(msg.sender));
    }

    function getLotteryBalance() public view returns (uint) {
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp, participants.length)));
    }

    function lotteryWinner() public {
        require(msg.sender == manager);
        require(participants.length >= 3);

        address payable lottery_winner;
        uint r = random();
        uint index = r % participants.length;
        lottery_winner = participants[index];
        lottery_winner.transfer(getLotteryBalance());
        participants = new address payable[] (0);
    }
}
