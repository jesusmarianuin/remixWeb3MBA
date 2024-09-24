// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleContract {
    uint256 public number;
    address public myAddress;

    event NewNumberSet(uint256 oldNumber, uint256 newNumber);
    
    constructor (uint256 _number)  {
       _setNumber (_number);
    }

    function setNumber(uint256 _number) public {
       _setNumber (_number);
    }

    function setMyAdress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function isThisNumberLarger (uint256 _number) public view returns(bool) {
        return _number > number;
    }

    function sum (uint256 _number1, uint256 _number2) public pure returns(uint256) {
        return _number1 + _number2;
    }

    function _setNumber(uint256 _number) private  {
        emit NewNumberSet(number, _number);
        number = _number;
    }
}