// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "./ProductData.sol";

contract ProductStorage {
    address private owner;
    using ProductData for ProductData.Product;

    // store the products in a mapping
    mapping(string => ProductData.Product) public products;
    mapping(string => bool) private productsExist;

    constructor(address _owner) {
        owner = _owner;
        loadProduct(owner);
    }

    event AddProduct(address _from, string _name, uint indexed _timestamp);

    function loadProduct(address _owner) private {
        products["milk"] = ProductData.milk(10, _owner);
        productsExist["milk"] = true;

        products["bread"] = ProductData.bread(10, _owner);
        productsExist["bread"] = true;

        products["vodka"] = ProductData.vodka(5, _owner);
        productsExist["vodka"] = true;

        products["sausage"] = ProductData.sausage(5, _owner);
        productsExist["sausage"] = true;
    }

    function getProduct(string memory _name) public view returns(ProductData.Product memory){
        require(productsExist[_name], string.concat("Product ", _name, " not found"));

        return products[_name];
    }

    function addProduct(ProductData.Product memory _product) public {
        products[_product.name] = _product;
        productsExist[_product.name] = true;

        emit AddProduct(_product.owner, _product.name, block.timestamp);
    }

    function setProductQuantity(string memory _name, uint128 _quantity) public {
        require(productsExist[_name], string.concat("Product ", _name, " not found"));
        require(products[_name].quantity < _quantity, string.concat("Product ", _name, " not enought for required quantity"));

        products[_name].quantity -= _quantity;
    }
}