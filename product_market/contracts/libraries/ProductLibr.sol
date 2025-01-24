// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;
// pragma experimental ABIEncoderV2;

library ProductLibr {

    function getProductNames() internal pure returns (bytes32[4] memory) {
        // Use a fixed array of `bytes32` instead of `string`
        bytes32[4] memory product_names = [
            keccak256(abi.encodePacked("milk")),
            keccak256(abi.encodePacked("bread")),
            keccak256(abi.encodePacked("vodka")),
            keccak256(abi.encodePacked("sausage"))
        ];

        return product_names;
    }

    // Convert a string to lowercase before to check
    function toLower(string memory str) internal pure returns (string memory) {
        bytes memory bStr = bytes(str);
        for (uint256 i = 0; i < bStr.length; i++) {
            if (bStr[i] >= 0x41 && bStr[i] <= 0x5A) {
                bStr[i] = bytes1(uint8(bStr[i]) + 32);
            }
        }
        return string(bStr);
    }

    // Check if a name exists in the array, case-insensitive
    function isInLoadStorage(string memory name) internal pure returns (bool) {
        bytes32[4] memory _product_names = getProductNames();

        bytes32 nameHash = keccak256(abi.encodePacked(toLower(name)));
        for (uint256 i = 0; i < _product_names.length; i++) {
            if (_product_names[i] == nameHash) {
                return true;
            }
        }
        return false;
    }
}