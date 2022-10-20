// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// importing directly from npm package
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    
    function getPrice() internal view returns(uint256) {
        // ABI
        // Address (Goerli Testnet ETH - USD) 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        
        // ( uint80 roundID, int price, uint startedAt, uint timeStamp, uint80 answeredInRound ) = priceFeed.latestRoundData(); // Destructring

        ( , int price, , , ) = priceFeed.latestRoundData(); // Destructring

        return uint256(price * 1e10);
    }

    function getVersion() internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; // in solidity do * in parenthesis first, then devide
        return ethAmountInUsd;  
    }
}