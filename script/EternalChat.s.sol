// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {EternalChat} from "../src/EternalChat.sol";

contract EternalChatScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        EternalChat eternalChat = new EternalChat();

        vm.stopBroadcast();

        console.log('Contract address: %s', address(eternalChat));
    }
}
