/**
 * This file is autogenerated by Scaffold-ETH.
 * You should not edit it manually or your changes might be overwritten.
 */
import { GenericContractsDeclaration } from "~~/utils/scaffold-eth/contract";

const deployedContracts = {
  31337: {
    GrantExamp: {
      address: "0x610178dA211FEF7D417bC0e6FeD39F05609AD788",
      abi: [
        {
          inputs: [],
          stateMutability: "nonpayable",
          type: "constructor",
        },
        {
          anonymous: false,
          inputs: [
            {
              indexed: false,
              internalType: "address",
              name: "voter",
              type: "address",
            },
            {
              indexed: false,
              internalType: "uint256",
              name: "grantIndex",
              type: "uint256",
            },
          ],
          name: "VoteCast",
          type: "event",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "",
              type: "address",
            },
          ],
          name: "didDonate",
          outputs: [
            {
              internalType: "bool",
              name: "",
              type: "bool",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "",
              type: "address",
            },
          ],
          name: "didFund",
          outputs: [
            {
              internalType: "bool",
              name: "",
              type: "bool",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "address",
              name: "",
              type: "address",
            },
          ],
          name: "didVote",
          outputs: [
            {
              internalType: "bool",
              name: "",
              type: "bool",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "grantIndex",
              type: "uint256",
            },
          ],
          name: "getGrant",
          outputs: [
            {
              components: [
                {
                  internalType: "string",
                  name: "name",
                  type: "string",
                },
                {
                  internalType: "uint256",
                  name: "funding",
                  type: "uint256",
                },
                {
                  internalType: "uint256",
                  name: "voteCount",
                  type: "uint256",
                },
              ],
              internalType: "struct GrantExamp.Grant",
              name: "",
              type: "tuple",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "",
              type: "uint256",
            },
          ],
          name: "grants",
          outputs: [
            {
              internalType: "string",
              name: "name",
              type: "string",
            },
            {
              internalType: "uint256",
              name: "funding",
              type: "uint256",
            },
            {
              internalType: "uint256",
              name: "voteCount",
              type: "uint256",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256",
              name: "grantIndex",
              type: "uint256",
            },
          ],
          name: "voteOnGrant",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
      ],
      inheritedFunctions: {},
    },
    ImpactEquations: {
      address: "0x8A791620dd6260079BF849Dc5567aDC3F2FdC318",
      abi: [
        {
          inputs: [
            {
              internalType: "uint256[]",
              name: "R",
              type: "uint256[]",
            },
            {
              internalType: "uint256",
              name: "S",
              type: "uint256",
            },
          ],
          name: "calculateADIA",
          outputs: [
            {
              internalType: "uint256",
              name: "",
              type: "uint256",
            },
          ],
          stateMutability: "pure",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256[]",
              name: "R",
              type: "uint256[]",
            },
            {
              internalType: "uint256",
              name: "S",
              type: "uint256",
            },
          ],
          name: "calculateAFIA",
          outputs: [
            {
              internalType: "uint256",
              name: "",
              type: "uint256",
            },
          ],
          stateMutability: "pure",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256[]",
              name: "D",
              type: "uint256[]",
            },
            {
              internalType: "uint256[]",
              name: "R",
              type: "uint256[]",
            },
            {
              internalType: "uint256",
              name: "S",
              type: "uint256",
            },
          ],
          name: "calculateWDIA",
          outputs: [
            {
              internalType: "uint256",
              name: "",
              type: "uint256",
            },
          ],
          stateMutability: "pure",
          type: "function",
        },
        {
          inputs: [
            {
              internalType: "uint256[]",
              name: "F",
              type: "uint256[]",
            },
            {
              internalType: "uint256[]",
              name: "R",
              type: "uint256[]",
            },
            {
              internalType: "uint256",
              name: "S",
              type: "uint256",
            },
          ],
          name: "calculateWFIA",
          outputs: [
            {
              internalType: "uint256",
              name: "",
              type: "uint256",
            },
          ],
          stateMutability: "pure",
          type: "function",
        },
      ],
      inheritedFunctions: {},
    },
  },
} as const;

export default deployedContracts satisfies GenericContractsDeclaration;
