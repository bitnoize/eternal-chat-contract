// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {EternalChat} from "../src/EternalChat.sol";

contract EternalChatTest is Test {
    EternalChat public eternalChat;

    function setUp() public {
        eternalChat = new EternalChat();
    }
}
