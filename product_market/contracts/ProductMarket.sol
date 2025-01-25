// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "./ProductStorage.sol";
import "./struct/SaleInfo.sol";
import "./struct/Property.sol";
import "./products/AbsProduct.sol";

contract ProductMarket {
    address payable public owner;
    ProductStorage internal productStorage;
    // store sales of product
    mapping(uint => SaleInfo) private productSales;

    constructor(address _owner) payable {
        owner = payable(_owner);
        productStorage = new ProductStorage(owner);
    }

    event SaleProduct(uint indexed date, string productName, uint256 sum);

    event FillAccount(uint indexed date, string description, uint256 sum);

    fallback() external payable {
        revert("Attention! Call absent function.");
    }

    receive() external payable {
        uint256 _sum = msg.value;
        require(owner.send(msg.value), "Error! The transfer did not execute.");

        emit FillAccount(block.timestamp, "donation", _sum);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Error! Only owner can call this function.");
        _;
    }

    modifier customerBalance(uint256 balance, uint128 sum) {
        require(balance >= sum, "balance is less than sum of payment");
        _;
    }

    function sellProduct(string memory productName, uint128 orderQuantity) external payable customerBalance(msg.value, 100) {
        AbsProduct _product = productStorage.getProduct(productName);
    
        uint128 productQuantity = _product.getQuantity();
        require(productQuantity >= orderQuantity, "Failed! Not enough stock."); // Check product quantity

        (Property memory _property, ) = _product.getInfo();
        uint256 totalCost = _property.price * orderQuantity;

        // Important! Calling msg.value makes transfer funds customer to contract balance
        require(msg.value >= totalCost, "Failed! Account balance is less than total cost.");
        emit SaleProduct(block.timestamp, _property.name, totalCost);

        // Update product quantity
        uint128 updatedQuantity = productQuantity - orderQuantity;
        if (updatedQuantity == 0){
            productStorage.setProductExist(_property.name, false);
        }

        // Optionally, handle excess payment (refund)
        uint256 refund = totalCost - msg.value;
        if (refund > 0){
            payable(msg.sender).transfer(refund);
        }

        emit SaleProduct(block.timestamp, _property.name, totalCost);
    }

    // Function to allow the owner to withdraw any remaining balance in the contract
    function withdraw() public onlyOwner {
        uint256 _balance = address(this).balance;
        require(_balance > 0, "No balance to withdraw");
        require(owner.send(_balance), "Error! The transfer did not execute.");

        emit FillAccount(block.timestamp, "donation", _balance);
    }
}