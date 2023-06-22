// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// inherits from open zeppelin ERC721 contract (NFT standard)
contract TokenMaster is ERC721 {
    address public owner;
    uint public totalOccasions;

    struct Occasion {
        uint id;
        string name;
        uint cost;
        uint tickets;
        uint maxTickets;
        string date;
        string time;
        string location;
    }
    mapping(uint => Occasion) occasions;

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) {
        owner = msg.sender;
    }

    function list(
        string memory _name,
        uint _cost,
        uint _maxTickets,
        string memory _date,
        string memory _time,
        string memory _location
    ) public {
        totalOccasions++;
        occasions[totalOccasions] = Occasion(
            totalOccasions,
            _name,
            _cost,
            _maxTickets,
            _maxTickets,
            _date,
            _time,
            _location
        );
    }

    function getOccasion(uint _id) public view returns (Occasion memory) {
        return occasions[_id];
    }
}
