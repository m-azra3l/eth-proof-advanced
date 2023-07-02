// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "./WalletInsurance.sol";
import "./CollateralProtection.sol";

contract InsuranceFactory{
    // Mapping to store user addresses and their corresponding insurance contracts
    mapping(address => address) private userInsuranceContracts;   

    // Mapping to store user addresses and their corresponding wallet contracts
    mapping(address => address) private userWalletContract;       

    // Event emitted when a wallet insurance contract is created for a user
    event WalletInsuranceCreated(address indexed user, address walletInsurance);     

    // Event emitted when a collateral protection contract is created for a user
    event CollateralProtectionCreated(address indexed user, address collateralProtection);   


    // Function to create a wallet insurance contract
    function createWalletInsurance(uint256 _insuredAmount) external {
        // Check if the user already has an existing insurance contract
        require(userWalletContract[msg.sender] == address(0), "You already have an existing insurance contract.");

        // Create a new WalletInsurance contract with the specified insured amount
        WalletInsurance walletInsurance = new WalletInsurance(_insuredAmount);

        // Associate the WalletInsurance contract with the user by storing its address in the userWalletContract mapping
        userWalletContract[msg.sender] = address(walletInsurance);

        // Emit an event to indicate the creation of the WalletInsurance contract
        emit WalletInsuranceCreated(msg.sender, address(walletInsurance));
    }

    // Function to get the wallet contract associated with a user
    function getUserWalletContract() external view returns (address) {
        // Return the wallet contract address associated with the caller's address
        return userWalletContract[msg.sender];
    }

    // Function to create a collateral protection contract
    function createCollateralProtection() external {
        // Check if the user already has an existing insurance contract
        require(userInsuranceContracts[msg.sender] == address(0), "You already have an existing insurance contract.");

        // Create a new CollateralProtection contract
        CollateralProtection collateralProtection = new CollateralProtection();

        // Associate the CollateralProtection contract with the user by storing its address in the userInsuranceContracts mapping
        userInsuranceContracts[msg.sender] = address(collateralProtection);

        // Emit an event to indicate the creation of the CollateralProtection contract
        emit CollateralProtectionCreated(msg.sender, address(collateralProtection));
    }

    // Function to get the insurance contract associated with a user
    function getUserInsuranceContracts() external view returns (address) {
        // Return the insurance contract address associated with the caller's address
        return userInsuranceContracts[msg.sender];
    }
}