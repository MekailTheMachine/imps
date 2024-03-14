# Imps - Built with Scaffold-ETH 2

🧪 An open-source, up-to-date toolkit for building decentralized applications (dapps) on the Ethereum blockchain. It's designed to make it easier for developers to create and deploy smart contracts and build user interfaces that interact with those contracts.

#Abstract

Poor social health, poverty, lack of social programs and overall coordination lie at the roots of our inability to healthily progress as a species. Giving citizens more political power and insights on the inner mechanics of their social systems is now more possible than ever.
In our pursuit of enhancing community engagement we must carefully consider the operating systems and models underpinning our communities and organizations. 
These systems, which have evolved over thousands of years, remain central to our collective existence yet the opaque and arcane nature of many of these systems often undermines trust and inhibits meaningful community interaction. 
This opacity and lack of coordination can discourage engagement, and make it difficult and inefficient to operate. With today’s technology we have the power to mitigate many of the social issues described above, even litigatory behavior amongst HOAs and Homeowners, Non-profits, and more. To generate more trust, participation, and symbiosis within our underlying social infrastructures,we must focus on the development of our political infrastructures, underlying governance models, and approaches on bridging the two. 


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
graph TD
    Actor(Actor: User) -->|Manages Profile| Registry{{Registry Contract}}
    Registry -->|Deploys| Anchor{{Anchor Contract}}
    PoolManager(Pool Manager) -->|Creates Pool for Profile| Allo{{Allo Contract}}
    Allo -->|Validates Profile| Registry
    
    PoolManager -->|Manages Pool| Allo
    Allo -->|Invokes Pool Functions| BaseStrategy{{Base Strategy Contract}}
    
    PoolManager_Recipient_Allocator(Pool Manager/Recipient/Allocator) -->|Invokes Strategy-Specific Functions| BaseStrategy
    
    Donor_Funder(Donor/Funder) -->|Funds Pool| Allo
    Donor_Funder -->|Votes on Proposals| VotingContract{{Voting Contract}}
    VotingContract -->|Checks Funding Status| Allo
    VotingContract -->|Ensures Voting Threshold| VotingThreshold{{Voting Threshold Check}}
    VotingThreshold -->|Feedback to Voting| VotingContract

    classDef contracts fill:#b5e48c,stroke:#333,stroke-width:2px;
    classDef users fill:#76c893,stroke:#333,stroke-width:2px;
    class Actor,PoolManager,PoolManager_Recipient_Allocator,Donor_Funder users;
    class Registry,Anchor,Allo,BaseStrategy,VotingContract,VotingThreshold contracts;


```


# Objective 

Our goal is to close the transparency and accountability gaps in traditional public goods funding mechanisms. This will make funding more efficient and strengthen the bond between funders, donors, grantees, and their communities, fostering a sense of ownership, community, and purpose. We believe that this innovative approach can help increase public good funding and support important causes. We would like to provide tooling and resouces for enhanced governance within capital allocation and impact reporting. 
With these enhanced and capitally effecient methods we hope to provide more capital bandwith and effeciency to non-profits, HOAs, taxation systems, DAOs, Public Goods and Retro PG funding, and whatever more is to come.

# How 

This can be accomplished by integrating systems where grantees can link tangible proof of their work directly to their grants through hypercert technology, verifiable through EAS. With this data we can begin to give donors the power to evaluate and vote on the effectiveness fund utilization. If a grant receives negative feedback from a significant portion of its supporters, SQF and batch based funding can be halted, encouraging grantees to maintain some level of transparency and community engagement. This democratized oversight mechanism not only pressures grantees to be more open but also empowers more individuals to confidently invest in their communities, leading to broader participation in funding initiatives that have a real impact. 

Within AlloV2 Custom strategies, we can alter the flow of streamline or batch-based Quadratic Funding. Donors and funders can seperately review the impact reports within the grants they have contributed to, and weight their votes on how impactful they feel the project currently is. These voted weights can have negative affects on the grantees share of the QF pool, urging them to provide more impactful reports, or to reach out to funders or donors to address their attestation and attempt a resolve. 

By integrating the Scaffold-Eth-2 SDK we can allow any project or community to create their own custom funding strategy, questions, weights, and more. Abstracting the process of implementing custom strategies and deploying custom rounds with enhanced governance mechanisms will be an ever lasting journey. Below is a visualization of the reviewment process using a custom alloV2 protocol.

```mermaid
graph TD
    Donor_Funder(Donor/Funder) -->|Funds| GrantContract(Grant Contract)
    Donor_Funder -->|Contributes to| QFPool(QF Pool)
    Grantee(Grantee) -->|Creates| Grants(Grants)
    GrantContract -->|Allocates Funding to| Grants
    QFPool -->|Supplements Grants With| Grants
    Grants -->|Generates| ImpactReports(Impact Reports)
    Donor_Funder -->|Reviews/Attests to| ImpactReports
    ImpactReports -->|Influences| QFPool

    classDef grants fill:#88d498,stroke:#333,stroke-width:2px;
    classDef users fill:#4d908e,stroke:#333,stroke-width:2px;
    classDef qfpool fill:#f6c667,stroke:#333,stroke-width:2px;
    classDef impact fill:#f4acb7,stroke:#333,stroke-width:2px;
    class Grantee,Donor_Funder users;
    class GrantContract grants;
    class QFPool qfpool;
    class ImpactReports impact;
```

# About us 

Our team consists of experienced developers and experts in the Political and DeFi space. With shared history in working with non-profits and tracking federal grants funding allocated to under resourced communities, we are passionate about using technology for social good. We believe that IMPs has the potential to fill in the larger remaining gaps in public goods funding incetives within local communities. 
