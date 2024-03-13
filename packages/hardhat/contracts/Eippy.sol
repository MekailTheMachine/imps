// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";

contract Eippy is EIP712 {
  using ECDSA for bytes32;

  constructor(string memory name, string memory version)
    EIP712(name, version)
  {
  }

  bytes32 constant private MESSAGE_TYPEHASH = keccak256(
    "Message(uint16 score,address account,address _contract)"
  );

  struct Message {
    uint16 score;
    address account;
    address _contract;
  }

function createMessage(uint16 score, address account, address _contract) public pure returns (bytes32) {
    bytes32 DOMAIN_SEPARATOR = keccak256(
        abi.encode(
            keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
            keccak256(bytes("FundFactory")),
            keccak256(bytes("1")),
            10,
            _contract
        )
    );

    bytes32 digest = keccak256(
        abi.encodePacked(
            "\x19\x01",
            DOMAIN_SEPARATOR,
            keccak256(
                abi.encode(
                    MESSAGE_TYPEHASH,
                    score,
                    account,
                    _contract
                )
            )
        )
    );

    return digest;
}


  function verifySignature(uint16 score, address account, address _contract, bytes memory signature) public pure returns (bool) {
    bytes32 message = createMessage(score, account, _contract);
    return ECDSA.recover(message, signature) == account;
  }

  function recoverSigner(uint16 score, address account, address _contract, bytes memory signature) public pure returns (address) {
    bytes32 message = createMessage(score, account, _contract);
    return ECDSA.recover(message, signature);
  }

}