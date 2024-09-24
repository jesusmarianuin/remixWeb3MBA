// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Game {
    struct Hero {
        string name;
        uint256 level;
        uint256 attack;
        uint256 defense;
        uint256 lastTraining;
    }

    mapping(address => Hero) public heroes;
    // como ejemplo, un mapping puede tener mapping
    mapping(address => 
        mapping(address => Hero)
        ) public map2;

    modifier hasHero() {
        require(heroes[msg.sender].level > 0, "you don`t have a hero");
        _;
    }

    function createHero(string memory _name) public {
        //heroes[msg.sender] = Hero(_name, 1, 100, 100);
        require(heroes[msg.sender].level == 0, "you already have a hero");
        heroes[msg.sender] = Hero({name: _name, level: 1, attack: 100, defense: 23, lastTraining:0});
    }

    function fight(address _enemy) public hasHero {
        require(heroes[_enemy].level > 0, "enemy don`t have a hero");
        require(msg.sender != _enemy, "you can`t fight yourself");
        if (heroes[msg.sender].attack >= heroes[_enemy].defense) {
            _levelUp();
        }
    }

    function _levelUp() private {
        heroes[msg.sender].level += 1;
        heroes[msg.sender].attack += 10;
        heroes[msg.sender].defense += 12;
    }

    function train() public hasHero {
        require(block.timestamp - heroes[msg.sender].lastTraining > 1 days, "you cant`t only train once a day");
        heroes[msg.sender].lastTraining = block.timestamp;
        _levelUp();
    }

    function getMyHero() public view returns(Hero memory) {
        return heroes[msg.sender];
    }


}