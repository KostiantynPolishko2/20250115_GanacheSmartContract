// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "./MarketItem.sol";

contract MarketItemOwner {
    MarketItem public marketItem;
    address private owner;

    constructor (){
        owner = msg.sender;
    }

    function setMarketItem(MarketItem _marketItem) external {
        marketItem = _marketItem;
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function setOwner(address _owner) external {
        owner = _owner;
    }
}

