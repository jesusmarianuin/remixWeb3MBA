// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./IOracle.sol";

contract StableOracle is IOracle {
    function getPrice() external pure override returns(uint256) {
        return 1e18;
    }
}