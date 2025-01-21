// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

contract MarketItem {
    struct Item {
        string name;
        uint256 price;
        bool isAvailable;
    }

    enum Categories {dairy, bakery, fruits, vagatables}
    Categories public category;

    Item private marketItem;

    constructor (string memory _name, uint256 _price, bool _isAvailable, uint256 _category){
        marketItem = Item(_name, _price, _isAvailable);
        category = Categories(_category);
    }

    function getMarketItem() public view returns(Item memory, Categories){
        return (marketItem, category);
    }

    function setPrice(uint256 _price) external {
        marketItem.price = _price;
    }

    function setIsAvailable(bool _isAvailable) external {
        marketItem.isAvailable = _isAvailable;
    }
}
