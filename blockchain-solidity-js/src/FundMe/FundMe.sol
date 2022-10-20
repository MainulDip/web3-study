// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

import "./PriceConverter.sol";


contract FundMe {

    using PriceConverter for uint256;

    uint256 public minimumUsd = 50;

    address[] public funders;

    mapping(address => uint256) public addressToAmountFund;

    address public owner;

    constructor () {
        owner = msg.sender; // setting the owner, whoever deploy this contract
    }

    function fund() public payable {
        // number = 7; // cost gas because of mutating transaction
        
        require (msg.value.getConversionRate() >= minimumUsd , "Didn't send enough"); // 1e18 = 10 to the power 18 (wei) = 1 ETH
        
        funders.push(msg.sender);
        addressToAmountFund [msg.sender] = msg.value;
    }

    // applying modifier's checks
    function withdraw() public onlyOwner {

        // // check if sender is the owner
        // require(msg.sender == owner, "Sender is not the owner");


        // for (starting index,  ending index, stem amount)
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFund[funder] = 0;
        }

        // reset funders
        funders = new address[](0); // resetting array

        // actually withdraw fund // docs : solidity-by-example.org/sending-ether/

        // transfer
        // payable(msg.sender).transfer(address(this).balance);
        
        // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed");
        
        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");// return two variables
        require(callSuccess, "Call Failed");
    }

    // creating modifire
    modifier onlyOwner {
        // check if sender is the owner
        require(msg.sender == owner, "Sender is not the owner");
        _;
    }
}