// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract DataStorage {

  uint256 private balance;
  address private owner;

  constructor() {
    owner = msg.sender;
  }

  function setData(uint256 _balance) public {
    require(_balance > 0, "Error! The balance have to be > 0.");
    balance = _balance;
  }

  function getData() public view returns (uint256){
    return balance;
  }

  function getOwner() public view returns (address){
    return owner;
  }
}
