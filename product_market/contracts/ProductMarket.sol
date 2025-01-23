// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "./ProductProperty.sol";
import "./ProductData.sol";
import "./ProductStorage.sol";

contract ProductMarket {
    address private owner;
    ProductStorage internal productStorage;
    // store sales of product
    mapping(uint => ProductProperty) private productSales;

    constructor(address _owner){
        owner = _owner;
        productStorage = new ProductStorage(_owner);
    }

    modifier customerBalance(uint256 balance, uint128 sum) {
        require(balance >= sum, "balance is less than sum of payment");
        _;
    }

    event SaleProduct(uint indexed date, string productName, uint128 sum);

    function sellProduct(string memory productName, uint128 quantity) external payable customerBalance(msg.value, 100) {
        //ProductData.Product product = productStorage.getProduct(productName);

        //uint128 totalCost = product.quantity * product.price;
        //require(msg.value >= totalCost_, "balance is less than sum of payment");

    }
}