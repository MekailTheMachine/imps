interface IProjectReviewSystem {
    function submitReview(bytes32 projectId, uint8 rating) external;
    function getAverageRating(bytes32 projectId) external view returns (uint8);
    function isEligibleReviewer(address user, bytes32 projectId) external view returns (bool);
}
