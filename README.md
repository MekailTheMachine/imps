# Imps - Built with Scaffold-ETH 2

🧪 An open-source, up-to-date toolkit for building decentralized applications (dapps) on the Ethereum blockchain. It's designed to make it easier for developers to create and deploy smart contracts and build user interfaces that interact with those contracts.

## Supported Networks

| Network         | Chain ID |
| --------------- | -------- |
| Mainnet         | 1        |
| Goerli          | 5        |
| Sepolia         | 11155111 |
| Base            | 8453     |
| Base Goerli     | 84531    |
| Optimism        | 10       |
| Optimism Goerli | 420      |
| Celo            | 42220    |
| Celo Alfajores  | 44787    |
| Arbitrum        | 42161    |
| Arbitrum Sepolia| 421614   |


⚙️ Built using NextJS, RainbowKit, Hardhat, Wagmi, Viem, Allo, EAS, and Hypercert. 

## Diagram

```mermaid
flowchart
    Actor --> |profile management| Registry.sol --> |deploys|Anchor.sol
    PoolManager --> |createPool for profile| Allo.sol --> |validate profile| Registry.sol

    PoolManager --> |pool manager actions| Allo.sol --> |invoke pool function| BaseStrategy.sol

    PoolManager/Recipient/Allocator --> |invoke function unique to strategy implmentation|BaseStrategy.sol

    User --> |Me
```


# Objective 

Our goal is to create protocols where users of a grants stack or application can close the transparency and accountability gaps in traditional public goods funding mechanisms. This will make funding more efficient and strengthen the bond between funders, donors, grantees, and their communities, fostering a sense of ownership, community, and purpose. We believe that this innovative approach can help increase public good funding and support important causes.

# How 

This can be accomplished by integrating systems where grantees can link tangible proof of their work directly to their grants through hypercert technology, verified through EAS. With this data we can begin to give donors the power to evaluate and vote on the effectiveness fund utilization. If a grant receives negative feedback from a significant portion of its supporters, SQF and batch based funding can be halted, encouraging grantees to maintain some level of transparency and community engagement. This democratized oversight mechanism not only pressures grantees to be more open but also empowers more individuals to confidently invest in their communities, leading to broader participation in funding initiatives that have a real impact. We believe this can be an underlying catalsyt to mass adoption of regenerative economic models in communities around the world. 

# About us 

Our team consists of experienced developers and experts in the Political and DeFi space. With shared history in working with non-profits and tracking federal grants funding allocated to under resourced communities, we are passionate about using technology for social good. We believe that IMPs has the potential to fill in the larger remaining gaps in public goods funding incetives within local communities. 
