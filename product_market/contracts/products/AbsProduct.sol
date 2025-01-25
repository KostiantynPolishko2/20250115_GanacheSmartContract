// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "../struct/Property.sol";

abstract contract AbsProduct {
    Property internal property;
    address internal owner;
    uint128 internal quantity;

    constructor(address _owner, uint128 _quantity){
        owner = _owner;
        quantity = _quantity;
    }

    function getInfo() public view virtual returns(Property memory, string memory);

    function getOwner() public view returns(address){
        return owner;
    }

    function getQuantity() public view returns(uint128){
        return quantity;
    }

    function setQuantity(uint128 _quantity) public {
        quantity = _quantity;
    }
}