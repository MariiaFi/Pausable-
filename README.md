# My Pausable ERC20 Token

This project implements an ERC20 token with pause functionality and owner-controlled mint/burn.

## Features

- ERC20 standard
- Pause and unpause all transfers
- Mint and burn tokens
- Ownable access control

## Deployment

Deployed via Hardhat or Remix. Initial supply minted to the owner.

## Usage

- `pause()`: Stops all transfers.
- `unpause()`: Resumes transfers.
- `mint(address,uint256)`: Owner mints tokens.
- `burn(uint256)`: Holder burns their tokens.
