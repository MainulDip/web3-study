// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract SimpleStorage {
   uint256 public favoriteNumber;

    // defining new type by structure
   struct People {
       uint256 favoriteNumber;
       string name;
   }

//    People public person = People({favoriteNumber: 2, name: "Patrick"});

    People[] public person; // dynamic empty array of People struct/type

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        People memory newPerson = People(_favoriteNumber, _name);
        person.push(newPerson);
    }


   function store(uint256 _favoriteNumber) public {
       favoriteNumber = _favoriteNumber;
   }

   function retrive() public view returns(uint256) {
       return favoriteNumber;
   }
}