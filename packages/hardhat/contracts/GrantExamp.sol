// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GrantExamp {

    mapping(address => bool) public didFund;
    mapping(address => bool) public didDonate;
    mapping(address => bool) public didVote;

    struct Grant {
        string name;
        uint256 funding;
        uint256 voteCount;
    }

    Grant[] public grants;

    // Event to emit when a vote is cast
    event VoteCast(address voter, uint256 grantIndex);

    constructor() {
        // Initialize with 3 fake grants, each with random fake funding
        grants.push(Grant("Grant A", 1000, 0));
        grants.push(Grant("Grant B", 500, 0));
        grants.push(Grant("Grant C", 1500, 0));
    }

    // Function to vote on a grant
    function voteOnGrant(uint256 grantIndex) external {
        require(grantIndex < grants.length, "Grant does not exist");
        require(didDonate[msg.sender], "Must have donated to vote");
        require(didVote[msg.sender] == false, "Already voted");
        grants[grantIndex].voteCount += 1; // Increment the vote count for the grant
        emit VoteCast(msg.sender, grantIndex);
    }

    // Function to get grant details
    function getGrant(uint256 grantIndex) external view returns (Grant memory) {
        require(grantIndex < grants.length, "Grant does not exist");
        return grants[grantIndex];
    }
}
