// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WrappedRune is ERC20, ERC20Permit, Ownable {
    constructor()
        ERC20("WrappedRune", "wRUNE")
        ERC20Permit("WrappedRune")
        Ownable()
    {}

    // Mint new tokens
    function mint(address to, uint256 amount) external onlyOwner(){
        _mint(to, amount);
    }
}
