// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IOracle {
    function getPrice() external view returns(uint256);

}