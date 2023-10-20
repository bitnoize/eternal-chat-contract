// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract EternalChat {
    uint256 public totalMessages;

    struct Message {
        string text;
        address from;
        uint256 timestamp;
    }

    Message[] storeMessages;

    address[] storeSenders;

    mapping(address => uint256) private messagesPerSender;

    event NewMessage(address indexed from, uint256 timestamp, string message);

    constructor() {
        console.log("Contract initialized");
    }

    function sendMessage(string memory _newMessage) public {
        console.log("%s has sent a message!", msg.sender);

        totalMessages += 1;
        messagesPerSender[msg.sender] += 1;

        storeMessages.push(Message(_newMessage, msg.sender, block.timestamp));

        if (messagesPerSender[msg.sender] == 1) {
          storeSenders.push(msg.sender);
        }

        emit NewMessage(msg.sender, block.timestamp, _newMessage);
    }

    function getAllMessages() public view returns (Message[] memory) {
        return storeMessages;
    }

    function getTotalMessages() public view returns (uint256) {
        return totalMessages;
    }

    function getAllSenders() public view returns (address[] memory) {
        return storeSenders;
    }
}
