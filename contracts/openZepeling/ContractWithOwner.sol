// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ContractWithOwner is Ownable {
    uint256 public number;

    constructor(address  _address) Ownable(_address){}
    // te deja Ownable: renunciar o transferir propiedad
    function setNumber(uint256 _number) public onlyOwner {
        number = _number;
    }
}