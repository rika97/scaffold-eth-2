// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^4.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WrappedRune is ERC20, ERC20Permit, Ownable {
    constructor(string memory _name, string memory _ticker, uint256 _supply) ERC20(_name, _ticker) ERC20Permit(_name) Ownable() {
        _mint(msg.sender, _supply);
    }

    // Mint new tokens
    function mint(address to, uint256 amount) external onlyOwner() {
        _mint(to, amount);
    }
}

contract WrappedRuneFactory {
    address[] public wrappedRunes;
    uint256 public wrappedRuneCount;
    event WrappedRuneDeployed(address tokenAddress);

    function deployWrappedRune(string calldata _name, string calldata _ticker, uint256 _supply) public returns (address) {
        WrappedRune wrappedRune = new WrappedRune(_name, _ticker, _supply);
        wrappedRune.transfer(msg.sender, _supply);
        wrappedRunes.push(address(wrappedRune));
        wrappedRuneCount += 1;
        emit WrappedRuneDeployed(address(wrappedRune));
        return address(wrappedRune);
    }
}
