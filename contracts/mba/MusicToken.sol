// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MusicToken is ERC721 {
    struct Song {
        string title;
        string artist;
        uint256 year;
        bytes32 hash;
    }
    mapping(uint256 => Song) public songs;
    mapping(bytes32 => uint256) public hashesToIds;
    uint256 totalSupply;

    constructor () ERC721("MusitToken", "MST"){}

    // es plataforma abierta asi que no es ownable
    function createSong(string memory _title, string memory _artist, uint256  _year, bytes32  _hash) public {
        require(hashesToIds[_hash] == 0, "Song already exists");
        totalSupply++;
        songs[totalSupply] = Song(_title, _artist, _year, _hash);
        hashesToIds[_hash] = totalSupply;
        _mint(msg.sender, totalSupply);
    }

    function getSongOwner(bytes32 _hash) public view returns(address) {
        return ownerOf(hashesToIds[_hash]);
    }

}