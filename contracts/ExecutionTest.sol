pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";

import "./aave-protocol/contracts/lendingpool/LendingPool.sol";

import "./aave-protocol/contracts/flashloan/base/FlashLoanReceiverBase.sol";
import "./aave-protocol/contracts/configuration/LendingPoolAddressesProvider.sol";
import "./aave-protocol/contracts/configuration/NetworkMetadataProvider.sol";

import "./aave-protocol/contracts/tokenization/AToken.sol";

import "./storage/PhStorage.sol";
import "./storage/AvConstants.sol";
import "./modifiers/PhOwnable.sol";

contract ExecutionTest is PhStorage, AvConstants, PhOwnable {

    using SafeMath for uint256;

    address daiAddress;

    // Define instance of external contracts
    LendingPool lendingPool;
    LendingPoolAddressesProvider provider;

    constructor(LendingPoolAddressesProvider _provider, address _daiAddress) public {
        provider = _provider;
        lendingPool = LendingPool(provider.getLendingPool());

        daiAddress = _daiAddress;
    }


    // Successful to call and get result.
    function getActiveReserves() public view returns (address[] memory _getReserves) {
        /// Retrieve LendingPool address
        //LendingPool lendingPool = LendingPool(provider.getLendingPool());

        return lendingPool.getReserves();
    }
    

















    function depositDAI() public returns (bool) {
        /**
        * Deposit of 1000 DAI
        */

        /// Retrieve LendingPool address
        LendingPoolAddressesProvider provider = LendingPoolAddressesProvider(provider);
        LendingPool lendingPool = LendingPool(provider.getLendingPool());

        /// Input variables
        //address daiAddress = "0x89d24a6b4ccb1b6faa2625fe562bdd9a23260359";
        uint256 amount = 1000 * 1e18;
        uint16 referral = 0;

        /// Deposit method call
        lendingPool.deposit(daiAddress, amount, referral);
    }
    



    // function redeemWithAtoken() public returns (bool) {
    //     /// Instantiation of the AToken address
    //     AToken aTokenInstance = AToken(aToken);
    //     //AToken aTokenInstance = AToken("/*aToken_address*/");

    //     /// Input variables
    //     uint256 amount = 1000 * 1e18;

    //     /// redeem method call
    //     aTokenInstance.redeem(amount);

    //     return AvConstants.CONFIRMED;
    // }
    
}

