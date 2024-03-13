//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

//import IERC20 from "@openzeppelin/contracts/token/ERC20/IERC20";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./FundFactory.sol";


contract FundMy {


address immutable public ALLOWED_TOKEN_ADDRESS = 0x72e4f9f808c49a2a61de9c5896298920dc4eeea9; // The only token allowed for funding this contract. $BITCOIN
// Lets also work on adjusting this so we can fund contract with ETH or allow the address to be in the constructor and callers from FundFactory.sol can set the address maybe?
address public immutable platform_address = 0x2061362893605Ce54aD89D177C92C3274c618352; // Address for the platform fee collection.
address immutable public owner; // Owner of the (this) child contract "FundMy", useful for some operations. Owner who started the campaign. 
address public benificiary; // Beneficiary address where the funds will be sent if the campaign succeeds.
IERC20 public noteToken; // Token interface for making ERC20 related operations.

mapping (address => uint256) public contributions; // Record of each account's contributions in Ether.
mapping (address => uint256) public token_contributions; // Record of each account's contributions in ERC20 tokens.

uint256 public immutable threshold; // Funding goal in Ether.
uint256 public immutable token_threshold; /// @notice Threshold for the contract in ERC20 tokens.
uint256 public time_limit; /// @notice time limit for the contract in seconds.
uint8 public gitcoin_scoreThreshold = 10; /// @notice threshold for the contract in wei.
uint8 public platform_fee; /// @notice the platform fee

bool public threshold_crossed; // the threshold crossed boolean flag
FundFactory private immutable fundFactory; // Instance of the FundFactory, useful for some owner operations.

// ~ Events ~
/// @notice The contract is funded.
event Funded(address contributor, uint256 amount);
event NoteFunded(address contributor, uint256 amount);

// Custom errors for clearer transaction rejections
error IsntAllowedToken(); /// @notice Token not allowed for funding this contract.
error NoFundsSent(); /// @notice No funds are sent with the transaction
error NotOwner(); /// @notice Not the contract owner
error NotContributor(); /// @notice Caller has not contributed to the contract
error ThresholdNotMet(); /// @notice Threshold has not been met
error ThresholdMet(); /// @notice Threshold is already met
error TimeLimitNotMet(); /// @notice Time limit for the contract hasn't been reached
error TimeLimitTooLong(); /// @notice Time limit is too long

    constructor (address FundingFactory, address _benificiary, uint256 _threshold, uint256 _time_limit, uint256 _token_threshold, uint16 gitcoinScore) {
        // Set platform fee based on Gitcoin score.
        if (gitcoinScore > gitcoin_scoreThreshold) {
            platform_fee = 0;
        } else {
            // If the score is less than the threshold, set the platform fee to 3%.
            platform_fee = 3;
        }

        // Initialize the token.
        noteToken = IERC20(ALLOWED_TOKEN_ADDRESS); //HPSOI10 $BITCOIN

        // Set owner, thresholds, and other details.
        owner = tx.origin;
        threshold = _threshold;
        token_threshold = _token_threshold;
        
        fundFactory = FundFactory(FundingFactory);
        benificiary = _benificiary;

        // Ensure the provided time_limit is not more than 30 days.
        if (_time_limit > 2592000) {
            revert TimeLimitTooLong();
        }
        time_limit = block.timestamp + _time_limit* 1 seconds;
    }

    // Allow the contract to receive Ether.
    receive() external payable {
        FundMy();
    }


    /// @notice Checks if the funding goals (either in Ether or tokens) have been met.
    function funded() public view returns (bool) {
        return address(this).balance >= threshold || noteToken.balanceOf(address(this)) >= token_threshold;
    }


    /// @notice Returns the balance of ALLOWED_TOKEN_ADDRESS tokens held by this contract.
    function token_balance() public view returns (uint256) {
        return noteToken.balanceOf(address(this));
    }


    /// @notice Allows contributors to fund the campaign using Ether.
    function fundMy() public payable {
        // Ensure the contributor sent some Ether with their transaction.
        if (msg.value <= 0) revert NoFundsSent();
        // Record the contribution.
        contributions[msg.sender] += msg.value; // Updating the Ether contribution for the sender
        // Check if the funding goals have been met.
        if (funded()) threshold_crossed = true; // Marking threshold as crossed if funding goal is met

        emit Funded(msg.sender, msg.value); // Emitting an event for the contribution
    }

    /// @notice Allows the owner to change the beneficiary of the campaign.
    /// @param _benificiary New beneficiary address.
    function change_benificiary(address _benificiary) public {
        // Ensure only the owner can call this.
        if (msg.sender != owner) revert NotOwner();
        benificiary = _benificiary; // Updating the beneficiary
    }


    /// @notice Updates the platform fee based on the owner's Gitcoin score.
    /// @return The Gitcoin score of the owner.

    function updateFeeStatusGitcoin() external returns (uint16) {
        // Ensure only the owner can call this.
        if (msg.sender != owner) revert NotOwner();
        // If the Gitcoin score exceeds the threshold, set platform fee to 0.
        if (fundFactory.gitcoin_scores(msg.sender) > gitcoin_scoreThreshold) platform_fee = 0;

        return fundFactory.gitcoin_scores(msg.sender);  // Returning the Gitcoin score of the owner
    }
    
    
    /// @notice Allows contributors to reclaim their contributions if the funding goal is not met after the time limit.
    function withdraw_threshold_missed() public {
        // Ensure only contributors can call this.
        if (contributions[msg.sender] <= 0) revert NotContributor();
        // Ensure funding goal isn't met.
        if (address(this).balance >= threshold) revert ThresholdMet();
        // Ensure time limit has passed.
        if (block.timestamp < time_limit) revert TimeLimitNotMet();
        uint256 amount = contributions[msg.sender];
        contributions[msg.sender] = 0; // Reset the user's contribution
        payable(msg.sender).transfer(amount); // Sending back the Ether to the contributor
    }


 /// @notice Allows the owner to withdraw funds if the funding goal is met.
    function withdraw_threshold_met() public {
        // Ensure only the owner can call this.
        if (msg.sender != owner) revert NotOwner();

        // Ensure funding goal is met.
        if (address(this).balance < threshold) revert ThresholdNotMet();

        // Calculate the platform fee and amount to be sent to the beneficiary.
        uint256 _platform_fee = (address(this).balance * platform_fee) / 100;
        uint256 amount = address(this).balance - _platform_fee;

        payable(benificiary).transfer(amount); // Sending the funds to the beneficiary

        if (platform_fee > 0) {
            payable(platform_address).transfer(_platform_fee); // Transferring the platform fee
        }
    }

 /// @notice Allows contributors to fund the campaign using the ALLOWED_TOKEN_ADDRESS token.
    /// @param amount Amount of tokens to contribute.
    function contributeWithToken(uint256 amount) external {
        token_contributions[msg.sender] += amount; // Updating the token contribution for the sender
        noteToken.transferFrom(msg.sender, address(this), amount); // Transferring the tokens to the contract

        // Check if the funding goals have been met.
        if (funded()) threshold_crossed = true; // Marking threshold as crossed if funding goal is met

        emit NoteFunded(msg.sender, amount); // Emitting an event for the token contribution
    }

    /// @notice Allows contributors to reclaim their token contributions if the funding goal is not met after the time limit.
    function withdraw_threshold_missed_with_token() public {
        // Ensure the threshold hasn't been crossed.
        if (threshold_crossed != true) revert ThresholdNotMet();

        // Ensure only contributors can call this.
        if (token_contributions[msg.sender] <= 0) revert NotContributor();

        // Ensure time limit has passed.
        if (block.timestamp < time_limit) revert TimeLimitNotMet();

        uint256 amount = token_contributions[msg.sender];
        token_contributions[msg.sender] = 0;  // Reset the user's token contribution
        noteToken.transfer(msg.sender, amount); // Sending back the tokens to the contributor
    }

    /// @notice Allows the owner to withdraw token contributions if the funding goal is met.
    function withdraw_threshold_met_with_token() public {
        // Ensure only the owner can call this.
        if (msg.sender != owner) revert NotOwner();

        // Ensure funding goal is met.
        if (threshold_crossed != true) revert ThresholdNotMet();

        // Calculate the platform fee and amount to be sent to the beneficiary in tokens.
        uint256 token_balances = token_balance();
        uint256 _platform_fee = (token_balance * platform_fee) / 100;  // Calculating the platform fee
        uint256 amount = token_balances - _platform_fee; // Calculating the net amount to be sent to the beneficiary

        noteToken.transfer(benificiary, amount);  // Sending the net amount in tokens to the beneficiary

        if (platform_fee > 0) {
            noteToken.transfer(platform_address, _platform_fee);  // Transferring the platform fee in tokens
        }
    }
}