// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "./ProductStorage.sol";
import "./struct/Sale.sol";

contract ProductMarket {
    address payable private owner;
    ProductStorage internal productStorage;
    // store sales of product
    mapping(uint => Sale) private productSales;

    constructor(address _owner) payable {
        owner = payable(_owner);
        productStorage = new ProductStorage(_owner);
    }

    event SaleProduct(uint indexed date, string productName, uint256 sum);

    event FillAccount(uint indexed date, string description, uint256 sum);

    fallback() external payable {
        revert("Attention! Call absent function.");
    }

    receive() external payable {
        require(owner.send(msg.value), "Error! The transfer did not execute.");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Error! Only owner can call this function.");
        _;
    }

    modifier customerBalance(uint256 balance, uint128 sum) {
        require(balance >= sum, "balance is less than sum of payment");
        _;
    }

    function sellProduct(string memory productName, uint128 quantity) external payable customerBalance(msg.value, 100) {
        //ProductData.Product product = productStorage.getProduct(productName);

        //uint128 totalCost = product.quantity * product.price;
        //require(msg.value >= totalCost_, "balance is less than sum of payment");

    }
}