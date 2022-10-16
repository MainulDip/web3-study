// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    // Inheritance

    // overriding, also require to make the parent function overridable by setting that "virtual"
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}