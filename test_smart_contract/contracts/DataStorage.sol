// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract DataStorage {

  uint256 public dataStorage;


  // constructor() public {
  // }

  function setData(uint256 x) public {
    dataStorage = x;
  }

  function getData() public view returns (uint256){
    return dataStorage;
  }
}
