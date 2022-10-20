// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// importing directly from npm package
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract FundMe {
    uint256 public minimumUsd = 50;

    function fund() public payable {
        // number = 7; // cost gas because of mutating transaction

        require(getConversionRate(msg.value) >= minimumUsd , "Didn't send enough"); // 1e18 = 10 to the power 18 (wei) = 1 ETH
    }

    
    function getPrice() public view returns(uint256) {
        // ABI
        // Address (Goerli Testnet ETH - USD) 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        
        // ( uint80 roundID, int price, uint startedAt, uint timeStamp, uint80 answeredInRound ) = priceFeed.latestRoundData(); // Destructring

        ( , int price, , , ) = priceFeed.latestRoundData(); // Destructring

        return uint256(price * 1e10);
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; // in solidity do * in parenthesis first, then devide
        return ethAmountInUsd;  
    }

    function withdraw() public {}
}
