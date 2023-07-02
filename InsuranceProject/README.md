# Sample Hardhat Project

The aim of this project is to create a Solidity-based insurance provider protocol. The protocol enables users to engage in two types of insurance: Wallet Insurance and Collateral Protection for Cryptocurrency Loans. Users have the ability to make premium payments, file insurance claims, and take advantage of the coverage offered by the protocol.

## Contracts

This repository contains three Solidity contracts: `CollateralProtection`, `WalletInsurance`, and `InsuranceFactory`. These contracts provide functionality for collateral protection, wallet insurance, and an insurance factory for creating contracts for users.

### CollateralProtection Contract

The `CollateralProtection` contract allows users to create loans and manage collateral. It includes the following features:

- Creation of a loan with a specified loan amount and collateral amount.
- Collection of the loan by the contract owner, if the collateral is sufficient.
- Payment of the loan by the contract owner.
- Tracking of loan policies, collateral amounts, and loan statuses.

#### Functions

- `createLoan(uint256 loanAmount, uint256 collateralAmount)`: Creates a loan with the specified loan amount and collateral amount.
- `collectLoan()`: Allows the contract owner to collect the loan if the collateral is sufficient.
- `payLoan()`: Allows the contract owner to pay off the loan.
- `getLoanCollateral(address borrower)`: Retrieves the collateral amount associated with a borrower.
- `getLoan(address borrower)`: Retrieves the loan policy associated with a borrower.

### WalletInsurance Contract

The `WalletInsurance` contract allows users to insure their wallets. It includes the following features:

- Payment of insurance premium to insure the wallet.
- Claiming the insurance after the coverage period has expired.
- Tracking of insured amount, insurance duration, and token balances.

#### Functions

- `payInsurance()`: Allows users to pay the insurance premium to insure their wallets.
- `claimInsurance()`: Allows the contract owner to claim the insurance after the coverage period has expired.
- `getBalance()`: Retrieves the balance of the caller's wallet.
- `getTokenBalance()`: Retrieves the token balance of the caller's wallet.

### InsuranceFactory Contract

The `InsuranceFactory` contract acts as a factory for creating `WalletInsurance` and `CollateralProtection` contracts for users. It includes the following features:

- Creation of a `WalletInsurance` contract for a user.
- Creation of a `CollateralProtection` contract for a user.
- Retrieval of the `WalletInsurance` contract associated with a user.
- Retrieval of the `CollateralProtection` contract associated with a user.

#### Functions

- `createWalletInsurance(uint256 insuredAmount)`: Creates a `WalletInsurance` contract for the caller with the specified insured amount.
- `getUserWalletContract()`: Retrieves the `WalletInsurance` contract associated with the caller.
- `createCollateralProtection()`: Creates a `CollateralProtection` contract for the caller.
- `getUserInsuranceContracts()`: Retrieves the `CollateralProtection` contract associated with the caller.

## Deploying

Download the codes by downloading the entire repository which will give you access to other contencts of the repository.In the project directory,  run:

```shell
 yarn install
```

To deploy the contract, setup your `.env` file by renaming the `.env.example` file to `.env`, paste your wallet private key where necessary and run the following command:

```shell
yarn hardhat run scripts/deploy.js --network mumbai
```

## Author

[Michael](https://github.com/m-azra3l)

## License

This project is licensed under the [MIT License](LICENSE).
