// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./IOracle.sol";

contract MaticCracle is IOracle {

    uint256 private price;

    constructor(uint256 _price){
        price = _price;
    }

    function setPrice(uint256 _price) public {
        price = _price;
    }

    function getPrice() external view override returns(uint256) {
        return price;
    }

    
}