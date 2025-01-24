// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "../struct/ProductProperty.sol";

library ProductData {

    function milk(uint128 _quantity, address _owner) internal pure returns (ProductProperty memory) {
        return ProductProperty("milk", "dairy", 42, _quantity, _owner);
    }

    function bread(uint128 _quantity, address _owner) internal pure returns (ProductProperty memory) {
        return ProductProperty("bread", "bakery", 21, _quantity, _owner);
    }

    function vodka(uint128 _quantity, address _owner) internal pure returns (ProductProperty memory) {
        return ProductProperty("vodka", "alcohol", 120, _quantity, _owner);
    }

    function sausage(uint128 _quantity, address _owner) internal pure returns (ProductProperty memory) {
        return ProductProperty("sausage", "meat", 220, _quantity, _owner);
    }

}