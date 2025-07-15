// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

// Import ERC20 with pausable extension
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
// Import access control for role management
import "@openzeppelin/contracts/access/AccessControl.sol";

/// @title MyPausableToken
/// @notice ERC20 token with roles and pause functionality
contract MyPausableToken is ERC20Pausable, AccessControl {
    /// @dev Role identifier for minters
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    /// @dev Role identifier for pausers
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    /// @notice Contract constructor
    /// Grants all roles to the deployer and mints the initial supply
    constructor() ERC20("My Pausable Token", "MPT") {
        // Grant admin role to deployer
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        // Grant minter role to deployer
        _grantRole(MINTER_ROLE, msg.sender);
        // Grant pauser role to deployer
        _grantRole(PAUSER_ROLE, msg.sender);

        // Mint initial supply to deployer
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    /// @notice Mint new tokens to a specified account
    /// @param to The address receiving the tokens
    /// @param amount The amount of tokens to mint
    function mint(address to, uint256 amount) public {
        require(hasRole(MINTER_ROLE, msg.sender), "Not a minter");
        _mint(to, amount);
    }

    /// @notice Burn tokens from the caller's balance
    /// @param amount The amount of tokens to burn
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    /// @notice Pause all token transfers
    function pause() public {
        require(hasRole(PAUSER_ROLE, msg.sender), "Not a pauser");
        _pause();
    }

    /// @notice Unpause all token transfers
    function unpause() public {
        require(hasRole(PAUSER_ROLE, msg.sender), "Not a pauser");
        _unpause();
    }
}
