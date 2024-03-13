//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./FundMy.sol";
import "./Eippy.sol";

// Custom error for invalid signature checks
error InvalidSignature();

/// @title Factory contract to create instances of the FundMy contracts.
contract FundFactory {

    // Owner of this factory contract
    address public owner;

    // Keeps track of how many FundMy contracts an address has created
    mapping (address => uint256) public FundMyCount;

    // Keeps track of the FundMy contract addresses associated with a creator address
    mapping (address => address[]) public FundMyAddresses;

    // Stores all the FundMy contract addresses ever created using this factory
    address[] public FundMyAddressesAll;

    // Reference to the Eippy contract (possibly used for additional verification)
    Eippy private eippy;

    // Gitcoin scores of users. Possibly used for additional verification or metrics.
    mapping (address => uint16) public gitcoin_scores;

    // Total number of FundMy contracts ever created
    uint256 public FundMyTotal = 0;

    // The original address of this contract
    address private immutable original;

    /// @param verifierContract The address of a contract used for additional verification.
    constructor(address verifierContract) {
        owner = msg.sender;
        eippy = Eippy(verifierContract);
        original = address(this);
    }

    function checkNotDelegateCall() private view {
        require(address(this) == original, "NoDelegateCall: delegatecall detected");
    }

    /// @notice A modifier to make a function callable only directly and prevent delegatecalls
    modifier noDelegateCall() {
        checkNotDelegateCall();
        _;
    }

    /// @notice Event emitted when a new FundMy contract is created.
    event FundMyCreated(address FundMyAddress, address owner);

    /// @notice Creates a new FundMy contract!
    function createFundMy(address beneficiary, uint256 _threshold, uint256 _time_limit, uint256 _token_threshold) external noDelegateCall returns (address) {
        FundMy newFundMy = new FundMy(address(this), beneficiary, _threshold, _time_limit, _token_threshold, 0); // Initialize the new contract. Your dreams now have a new home
        FundMyCount[msg.sender] += 1;  // Increment the count of contracts created by the sender
        FundMyAddresses[msg.sender].push(address(newFundMy)); // Store this new contract's address under the creator's account. Big W
        FundMyAddressesAll.push(address(newFundMy)); // Add this new contract to the global list. <3 <3 <3
        FundMyTotal += 1; // Increment the total contracts created. (The ecosystem grows)
        emit FundMyCreated(address(newFundMy), msg.sender); // Notify the world of this new creation.
        return address(newFundMy); // Return the new contract's address. Return hope to the user ! 
    }


    /// @notice New FundMy contract but with Gitcoin metrics; time 2 marry innovation with reputation >:)

    function createFundMyGitcoin(address beneficiary, uint256 _threshold, uint256 _time_limit, uint256 _token_threshold, uint16 gitcoinScore) external noDelegateCall returns (address) {
        FundMy newFundMy = new FundMy(address(this), beneficiary, _threshold, _time_limit, _token_threshold, gitcoinScore);
        FundMyCount[msg.sender] += 1;
        FundMyAddresses[msg.sender].push(address(newFundMy));
        FundMyAddressesAll.push(address(newFundMy));
        FundMyTotal += 1;
        emit FundMyCreated(address(newFundMy), msg.sender);
        return address(newFundMy);
    }

    /// @notice Harness the power of ECDSA for signature verification on bytes32.
using ECDSA for bytes32;

/// @notice Retrieves the visionary - (the owner)
function getOwner() external view returns (address) {
    // Return the address of the entity that started this journey.
    return owner;
}

/// @notice A mirror reflecting the address of this very factory contract.
function getFactory() external view returns (address) {
    return address(this);
}

function getFundMyCount(address _user) external view returns (uint256) {
    // Return the count of dreams and ideas a user has launched.
    return FundMyCount[_user];
}

/// @notice Navigates and returns the pathways (addresses) of a user's FundMy endeavors.
function getFundMyAddresses(address _user) external view returns (address[] memory) {
    // Providing a map of each FundMy voyage a user has embarked upon.
    return FundMyAddresses[_user];
}

/// @notice Authentically verifies a user's standing with their Gitcoin score passport.
/// @dev Seamlessly integrating on-chain actions with off-chain metrics.
function verifyPassport(uint16 score, bytes memory signature) public returns (bool) {
    if (eippy.verifySignature(score, msg.sender, address(this), signature) == false) {  
        revert InvalidSignature();
    }
    // Upon successful verification, etch the user's score on-chain.
    gitcoin_scores[msg.sender] = score;
    return true;
}
}