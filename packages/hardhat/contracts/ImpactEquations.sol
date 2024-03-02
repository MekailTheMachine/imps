// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImpactEquations {

    // Variables as defined in the image
    // S: Reviews Total
    // R: Review Score
    // D: Donor
    // F: Funder
    // Θ: Contribution Ratio to Pool

    // Function for aDIA: ∑ (D * R) / S
    function calculateADIA(uint256[] memory R, uint256 S) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < R.length; i++) {
            sum += R[i];
        }
        return sum / S;
    }

    // Function for wDIA: ∑ (D * R(D)) / S
    function calculateWDIA(uint256[] memory D, uint256[] memory R, uint256 S) public pure returns (uint256) {
        uint256 weightedSum = 0;
        for (uint256 i = 0; i < D.length; i++) {
            weightedSum += D[i] * R[i];
        }
        return weightedSum / S;
    }

    // Function for aFIA: ∑ (F * R) / S
    function calculateAFIA(uint256[] memory R, uint256 S) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < R.length; i++) {
            sum += R[i];
        }
        return sum / S;
    }

    // Function for wFIA: ∑ (F * R(F)) / S
    function calculateWFIA(uint256[] memory F, uint256[] memory R, uint256 S) public pure returns (uint256) {
        uint256 weightedSum = 0;
        for (uint256 i = 0; i < F.length; i++) {
            weightedSum += F[i] * R[i];
        }
        return weightedSum / S;
    }
}
