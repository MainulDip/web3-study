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
The more "stuff" in the function the more more gas it costs.


### Scope of variables:
local scoped variable is not accessible from outside, like other programming languages.

### Custom Getter:
```solidity
function retrieve() public view returns(uint256) {
    return someVariableUint254;
}
```
