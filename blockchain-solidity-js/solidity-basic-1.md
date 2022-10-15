### Overview:

### Setup Instructions :


### Compiler Version and Define Class/Contract (class is Contract):
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleStorage {
    // boolean, uint (unsigned - only positive whole number), int (positive or negative), address, bytes
    // uint8 to uint256 (from 8 bit to 256 bit)
    bool hasFavoriteNumber = true;
    uint256 favoriteNumber; // default is uint256 and initial default value is 0
    string favText = "Seven"; // string are also bytes but only for strings
    int256 favInt = -7;
    address myAddress = 0xd12Cca947D5f31BCD8f5686d4D4dF096f7f475f7;
    bytes32 someBytes = "cat"; // converted to bytes // bytes2 to bytes32
}
```

### Visibility Specifiers || Modifiers:
* public: visible externally and internally (creates a getter funxtion for storage/state variables)
* private: only visible in the current contract
* external: only visible externall (only for functions) - i.e. can only be message-called (via this.func)
* internal: only visible internally || Default

### Transaction:
* contracts are deployed through transaction. Also when variable/s changes, it will cost another transaction.

### Gas Cost: 
The more "stuff" in the function the more more gas it costs. Non view and pure function will not cost gas in called alone. But Other functions or state changing functions will cost gas as it will be conunted as a transaction. 


### Scope of variables:
local scoped variable is not accessible from outside, like other programming languages.

### Custom Getter:
view is for reading contract/state. View and pure funcitons don't allow state modifications. pure function don't allow reding block chain state/s.

also if a view function is called from a non-view/gas-costing function, it will cost gas as usual.
```solidity
// view and pure functions doesn't cost gas on change when called alone.
function retrieve() public view returns(uint256) {
    return someVariableUint254;
}

// pure function is just for math, not to change state or getter
function add() public pure returns(uint256){
    return (1+1);
}
```

### struct:
```solidity
 // defining new type by structure
   struct People {
       uint256 favoriteNumber;
       string name;
   }

   People public person = People({favoriteNumber: 2, name: "Patrick"});

   People public person2 = People(2, "Patrick"}); // implicit / without braces
```

### Automatic Indexing:
variables inside contract or struct get automatic indexing (0 based).

### Arrays:
```solidity
struct People {
    uint256 favoriteNumber;
    string name;
}

People[] public person; // dynamic empty array of People struct/type
People[12] public person; // fixed numbered empty array of People struct/type. It can hold 12 array/list

function addPerson(string memory _name, uint256 _favoriteNumber) public {
    People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
    // People memory newPerson = People(_favoriteNumber, _name); // without parameter name and braces
    person.push(newPerson);
}
```