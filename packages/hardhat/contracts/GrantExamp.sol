// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GrantExamp {

    mapping(address => uint256) public contributions; // Track each address's total contribution
    uint256 public totalFunding; // Track the total funding in the contract

    struct Grant {
        string name;
        uint256 fundingGoal; // The funding goal for the grant
        uint256 totalFunding; // Total funding received for this grant
        mapping(address => uint256) funders; // Track funding contribution per address for this grant
        uint256 voteCount; // Total number of votes for the grant
    }

    Grant[] public grants;

    event VoteCast(address voter, uint256 grantIndex);
    event FundsContributed(address funder, uint256 amount, uint256 grantIndex);

    constructor() {
        // Initialize with 3 fake grants, each with random fake funding goals
        grants.push(Grant("Grant A", 900, 0, 0));
        grants.push(Grant("Grant B", 500, 0, 0));
        grants.push(Grant("Grant C", 1500, 0, 0));
    }

    function contribute(uint256 grantIndex) external payable {
        require(grantIndex < grants.length, "Grant does not exist");
        Grant storage grant = grants[grantIndex];
        grant.funders[msg.sender] += msg.value; // Track individual contribution
        grant.totalFunding += msg.value; // Update total funding for the grant
        totalFunding += msg.value; // Update total funding in the contract
        contributions[msg.sender] += msg.value; // Update sender's total contribution
        emit FundsContributed(msg.sender, msg.value, grantIndex);
    }

    function voteOnGrant(uint256 grantIndex) external {
        require(grantIndex < grants.length, "Grant does not exist");
        require(contributions[msg.sender] > 0, "Must have funded to vote");
        Grant storage grant = grants[grantIndex];
        require(grant.funders[msg.sender] > 0, "Must fund this grant to vote");
        grant.voteCount += 1; // Increment the vote count for the grant

        emit VoteCast(msg.sender, grantIndex);
    }

    function getGrant(uint256 grantIndex) external view returns (string memory name, uint256 fundingGoal, uint256 totalFunding, uint256 voteCount) {
        require(grantIndex < grants.length, "Grant does not exist");
        Grant storage grant = grants[grantIndex];
        return (grant.name, grant.fundingGoal, grant.totalFunding, grant.voteCount);
    }

    // Additional helper functions can be added to interact with the grants and their funders...
}
