import { expect } from "chai";
import { Contract } from "ethers";
import { ethers } from "hardhat";

const helper = async (victim: Contract, attacker: Contract) => {
  // add code here that will help you pass the test
  for (let i = 0; i < 10; i++) {
    await attacker.functions.hackContract();
  }
};

export default helper;
