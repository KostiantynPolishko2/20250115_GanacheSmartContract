// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "./ProductProperty.sol";
import "./ProductData.sol";

contract ProductStorage {
    address private owner;

    // store the products in a mapping
    mapping(string => ProductProperty) public products;
    mapping(string => bool) private productsExist;

    constructor(address _owner) {
        owner = _owner;
    }

    event AddProduct(address _from, string _name, uint indexed _timestamp);

    function loadProduct() public {
        products["milk"] = ProductData.milk(10, owner);
        productsExist["milk"] = true;

        products["bread"] = ProductData.bread(10, owner);
        productsExist["bread"] = true;

        products["vodka"] = ProductData.vodka(5, owner);
        productsExist["vodka"] = true;

        products["sausage"] = ProductData.sausage(5, owner);
        productsExist["sausage"] = true;
    }

    function getProduct(string memory _name) public view returns(ProductProperty memory){
        require(productsExist[_name], string.concat("Product ", _name, " not found"));

        return products[_name];
    }

    function addProduct(ProductProperty memory _product) public {
        require(!productsExist[_product.name], string.concat("Product '", _product.name, "' is already exist!"));

        products[_product.name] = _product;
        productsExist[_product.name] = true;

        emit AddProduct(_product.owner, _product.name, block.timestamp);
    }
}