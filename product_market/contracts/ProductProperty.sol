// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

struct ProductProperty {
    string name;
    string category;
    uint128 price;
    uint128 quantity;
    address owner;
}