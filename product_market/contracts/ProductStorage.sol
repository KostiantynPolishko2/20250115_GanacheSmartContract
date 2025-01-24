// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "./struct/Property.sol";
import "./products/AbsProduct.sol";
import "./products/Milk.sol";
import "./products/Bread.sol";
import "./products/Vodka.sol";
import "./products/Sausage.sol";
import "./libraries/ProductLibr.sol";

contract ProductStorage {
    using ProductLibr for string;
    address private owner;

    // store the products in a mapping
    mapping(string => address) private products;
    mapping(string => bool) private productsExist;

    constructor(address _owner) {
        owner = _owner;
    }

    event AddProduct(address _from, string _name, uint indexed _timestamp);

    function getNameAdress(AbsProduct _product) private view returns (string memory, address){
        (Property memory _property, ) = _product.getInfo();

        return (_property.name, address(_product));
    }

    function loadProduct() public {
        AbsProduct milk = new Milk(owner, 10);
        addProduct(milk);

        AbsProduct bread = new Bread(owner, 7);
        addProduct(bread);

        AbsProduct vodka = new Vodka(owner, 5);
        addProduct(vodka);

        AbsProduct sausage = new Sausage(owner, 8);
        addProduct(sausage);

        emit AddProduct(owner, "all", block.timestamp);
    }

    function getProduct(string memory _name) public view returns(AbsProduct){
        require(productsExist[_name], string.concat("Product ", _name, " not found"));
        address productAddress = products[_name];

        return AbsProduct(productAddress);
    }

    function addProduct(AbsProduct _product) public {
        (string memory _name, address _address) = getNameAdress(_product);
        require(!productsExist[_name], string.concat("Product '", _name, "' is already exist!"));

        products[_name] = _address;
        productsExist[_name] = true;

        if(!ProductLibr.isInLoadStorage(_name)){
            emit AddProduct(_product.getOwner(), _name, block.timestamp);
        }
    }
}