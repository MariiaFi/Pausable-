# My Pausable ERC20 Token

This project implements an ERC20 token with pause functionality and **role-based** access control (OpenZeppelin `AccessControl`).

## Features
- ERC20 standard (`ERC20Pausable`)
- Pause and unpause all transfers
- Mint and burn tokens
- **Role-based access**: `DEFAULT_ADMIN_ROLE`, `MINTER_ROLE`, `PAUSER_ROLE`
- Gas micro-optimization: custom errors instead of `require` strings

## Roles
- `DEFAULT_ADMIN_ROLE` — can grant/revoke roles.
- `MINTER_ROLE` — allowed to call `mint`.
- `PAUSER_ROLE` — allowed to call `pause` / `unpause`.

Grant roles from an admin account:
- `grantRole(MINTER_ROLE, <account>)`
- `grantRole(PAUSER_ROLE, <account>)`

## Deployment
Deploy via Remix or Hardhat.  
On deployment the sender:
- receives admin, minter and pauser roles,
- gets initial supply `1000 * 10**decimals()`.

## Usage
- `mint(address to, uint256 amount)` — **MINTER_ROLE** only.
- `burn(uint256 amount)` — burns caller’s tokens.
- `pause()` / `unpause()` — **PAUSER_ROLE** only.
- Check access: `hasRole(MINTER_ROLE, account)` etc.
