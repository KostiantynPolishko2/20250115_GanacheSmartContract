// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "../struct/Property.sol";
import "./AbsProduct.sol";

contract Vodka is AbsProduct {
    string private measure;

    constructor(address _owner, uint128 _quantity) AbsProduct(_owner, _quantity) {
        property = Property("vodka", "alchol", 120);
        measure = "0.7-l";
    }

    function getInfo() public view override returns(Property memory, string memory) {
        return (property, measure);
    }
}