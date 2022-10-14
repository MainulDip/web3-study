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