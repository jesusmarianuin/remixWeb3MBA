// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract GreenEnergyToken is ERC20, AccessControl {
    bytes32 public constant MANAGER = keccak256("MANAGER"); //hacer hash256
    bytes32 public constant PRODUCER = keccak256("PRODUCER");

    constructor() ERC20("GreenEnergy", "GRE"){
        grantRole(MANAGER, msg.sender);
    }
    
    //decorador
    modifier  onlyProducer() {
        require(hasRole(PRODUCER, msg.sender), "Only producer can do this");
        _;
    }

    function addProducer (address _newProducer) public {
        require(hasRole(MANAGER, msg.sender), "Only manager can add producer");
        grantRole(PRODUCER, _newProducer);
    }

    function produceEnergy(uint256 _amount) public onlyProducer {
        _mint(msg.sender, _amount);
    }

    function transfer(address to, uint256 amount) public onlyProducer override returns (bool) {
        return super.transfer(to, amount); 
    }
     function transferFrom(address from, address to, uint256 amount) public onlyProducer override returns (bool) {
        return super.transferFrom(from, to, amount);
    }

}