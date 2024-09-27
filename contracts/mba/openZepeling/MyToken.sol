// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor () ERC20("MyToken", "TKN") Ownable(msg.sender){
        _mint(msg.sender, 100 * 10**18); 
        // _mint es una function interna, es con _ y es solo usable por otro contrato heredado
    }

    function mint (address _to, uint256 _amount) public onlyOwner {
        _mint(_to,_amount);
    }

    function burn (address _to, uint256 _amount) public onlyOwner {
        _burn(_to,_amount);
        // es transferencia al address 000000000...
    }

}