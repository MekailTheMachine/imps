// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import "./FundMy.sol";

    // Errors 

    /// @notice isnt the allowed token error
    error NotIPFSHash();
    error StartsWithQm();
    error NotValidSignature();
    error NotOwner();

contract Profile is EIP712 {
    using ECDSA for bytes32;

    bytes32 public DOMAIN_SEPARATOR;
    mapping (address => string) public ipfsHash;
    bytes32 constant private MESSAGE_TYPEHASH = keccak256("Message(string _ipfsHash,address _contract)");

    constructor(string memory name, string memory version) EIP712(name, version) {
        DOMAIN_SEPARATOR = _domainSeparatorV4();
    }

    struct Message {
        string _ipfsHash;
        address _contract;
    }

    function createMessage(string memory ipfs_string, address _contract) public view returns (bytes32) {
        bytes32 digest = _hashTypedDataV4(keccak256(abi.encode(MESSAGE_TYPEHASH, keccak256(bytes(ipfs_string)), _contract)));
        return digest;
    }

    function verifySignature(string memory _ipfsHash, address _contract, bytes memory signature) public view returns (bool) {
        bytes32 message = createMessage(_ipfsHash, _contract);
        return ECDSA.recover(message, signature) == msg.sender;
    }

    function recoverSigner(string memory _ipfsHash, address _contract, bytes memory signature) public view returns (address) {
        bytes32 message = createMessage(_ipfsHash, _contract);
        return ECDSA.recover(message, signature);
    }

function setIpfsHash(string memory _ipfsHash, address _contract, bytes memory signature, address payable _FundMy) public {
    if (bytes(_ipfsHash).length != 46) {
        revert NotIPFSHash();
    }

    if (bytes(_ipfsHash)[0] != 0x51) {
        revert StartsWithQm();
    }

    if (recoverSigner(_ipfsHash, _contract, signature) == msg.sender) {
        revert NotValidSignature();
    }

    // Create an instance of FundMy using the _FundMy address
    FundMy FundMyInstance = FundMy(_FundMy);

    // Check if msg.sender is the owner of the contract _FundMy
    if (FundMyInstance.owner() != msg.sender) {
        revert NotOwner();
    }

    ipfsHash[_FundMy] = _ipfsHash;
}

}