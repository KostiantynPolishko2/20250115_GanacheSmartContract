// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;

library ProductData {
    struct Product {
        string name;
        string category;
        uint128 price;
        uint128 quantity;
        address owner;
    }

    function milk(uint128 _quantity, address _owner) internal pure returns (Product memory) {
        return Product("milk", "dairy", 42, _quantity, _owner);
    }

    function bread(uint128 _quantity, address _owner) internal pure returns (Product memory) {
        return Product("bread", "bakery", 21, _quantity, _owner);
    }

    function vodka(uint128 _quantity, address _owner) internal pure returns (Product memory) {
        return Product("vodka", "alcohol", 120, _quantity, _owner);
    }

    function sausage(uint128 _quantity, address _owner) internal pure returns (Product memory) {
        return Product("sausage", "meat", 220, _quantity, _owner);
    }

}