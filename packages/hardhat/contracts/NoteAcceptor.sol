// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Note_Acceptor {

    IERC20 public noteToken;
    address public owner;

    mapping (address => mapping (address => uint256)) public note_approval;

    constructor(IERC20 _noteToken) {
        noteToken = IERC20(_noteToken);
        owner = 0x9EEF30cb89EA5e8502B37Fa08cc3E1892cA00b10;

        
    }

    function deposit(uint256 amount) external returns (bool) {
        bool deposit_tokens = noteToken.transferFrom(msg.sender, address(this), amount);

        return deposit_tokens;
    }

    function withdraw(uint256 amount) external returns (bool) {
        require(msg.sender == owner, "Only the owner can withdraw tokens");
        bool withdraw_tokens = noteToken.transferFrom(address(this),msg.sender, amount);

        return withdraw_tokens;
    }
}