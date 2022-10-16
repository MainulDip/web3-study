// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    // initialized SimpleStorage by creating new instance
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    // calling SimpleStorage's storFavorite Method form this factory
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address ( like array address, not memory address )
        // ABI (Application Binary Interface) can be seen form Compilation Details
        // ABI provides all the input output details of the contract
        // SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber); // if it's address, not array
        // SimpleStorage(simpleStorageArray[_simpleStorageIndex]).store(_simpleStorageNumber);
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    // call SimpleStorage's getter/retruve function
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrive();
    }
}