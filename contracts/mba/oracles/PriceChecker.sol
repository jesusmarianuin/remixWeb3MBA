// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./IOracle.sol";

contract PriceChecker  {
    mapping (address => IOracle) public oracles;
    
    function setOracle (address _token, address _oracle) public {
        oracles[_token] = IOracle(_oracle);
    }

    function checkPrice (address _token) public view returns(uint256) {
        return oracles[_token].getPrice();
    }
}