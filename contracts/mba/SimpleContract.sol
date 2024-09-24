// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleContract {
    uint256 public number;
    address public nyAddress;
    
    constructor (uint256 _number)  {
        number = _number;
    }

}