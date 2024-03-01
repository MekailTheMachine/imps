// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.17;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "./IProjectReview.sol";
import "../ProjectRegistry.sol"; // Assume this contains the necessary interfaces

contract ProjectReview is IProjectReview, Initializable, OwnableUpgradeable {
    struct Review {
        uint8 rating;
        address reviewer;
    }

    event ReviewSubmitted(bytes32 indexed projectId, uint8 rating, address reviewer);

    // Maps project ID to its reviews
    mapping(bytes32 => Review[]) private _reviews;

    // Reference to the ProjectRegistry
    ProjectRegistry private _projectRegistry;

    function initialize(address projectRegistryAddress) external initializer {
        __Ownable_init();
        _projectRegistry = ProjectRegistry(projectRegistryAddress);
    }

    function submitReview(bytes32 projectId, uint8 rating) external override {
        require(_projectRegistry.isProjectRegistered(projectId), "Project not registered");
        require(isEligibleReviewer(msg.sender, projectId), "Not eligible to review");
        require(rating >= 1 && rating <= 5, "Rating out of bounds");

        _reviews[projectId].push(Review({rating: rating, reviewer: msg.sender}));
        // Emit an event for the new review
        emit ReviewSubmitted(projectId, rating, msg.sender);
    }

    function getAverageRating(bytes32 projectId) external view override returns (uint8) {
        Review[] storage reviews = _reviews[projectId];
        require(reviews.length > 0, "No reviews");

        uint256 totalRating;
        for (uint256 i = 0; i < reviews.length; i++) {
            totalRating += reviews[i].rating;
        }
        return uint8(totalRating / reviews.length);
    }

    function isEligibleReviewer(address user, bytes32 projectId) public view override returns (bool) {
        // Implement eligibility check, potentially involving a check
        // to see if the user has funded the project in a round
        return true; // Placeholder
    }
}
