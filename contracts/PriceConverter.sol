// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


library PriceConverter {
    function getPrice() internal view returns(uint256) {
        // Address: 
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5fb1616F78dA7aFC9FF79e0371741a747D2a7F22);
    (,int256 price,,,) = priceFeed.latestRoundData();
    // Price of ETH in USD
    // 20000000000
    return uint256(price * 1e18);


    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {

        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() internal view returns (uint256) {
        return AggregatorV3Interface(0x5fb1616F78dA7aFC9FF79e0371741a747D2a7F22).version();
    }



}