// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^4.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WrappedRune is ERC20, ERC20Permit, Ownable {
    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) ERC20Permit(name) Ownable() {
        _mint(msg.sender, initialSupply);
    }

    // Mint new tokens
    function mint(address to, uint256 amount) external onlyOwner() {
        _mint(to, amount);
    }
}

contract WrappedRuneFactory {
    address[] public wrappedRuneContracts;
    uint256 public wrappedRuneCount;
    event WrappedRuneDeployed(address indexed tokenAddress, string name, string symbol, uint256 initialSupply);

    function deployWrappedRune(string memory name, string memory symbol, uint256 initialSupply) external returns (address) {
        WrappedRune wrappedRune = new WrappedRune(name, symbol, initialSupply);
        wrappedRuneContracts.push(address(wrappedRune));
        wrappedRuneCount += 1;
        emit WrappedRuneDeployed(address(wrappedRune), name, symbol, initialSupply);
        return address(wrappedRune);
    }
}
