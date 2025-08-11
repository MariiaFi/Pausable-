// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title Pausable ERC20 Token
/// @author Mariia Fialkovska
/// @notice ERC20 token with pause and owner-controlled mint/burn
contract MyPausableToken is ERC20, Pausable, Ownable {
    /// @notice Constructor sets the token name and symbol
    constructor() ERC20("My Pausable Token", "MPT") {
        // Mint initial supply to owner (optional)
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    /// @notice Mint new tokens to an account
    /// @param to The address receiving the tokens
    /// @param amount The amount to mint
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /// @notice Burn tokens from caller's balance
    /// @param amount The amount to burn
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    /// @notice Pause all token transfers
    function pause() public onlyOwner {
        _pause();
    }

    /// @notice Unpause token transfers
    function unpause() public onlyOwner {
        _unpause();
    }

    /// @dev Hook that runs before any transfer/mint/burn
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, amount);
    }
}
