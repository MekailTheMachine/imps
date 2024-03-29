// Update this file any time a new Payout Strategy contract has been added
type PayoutParams = {
  factory: string;
  implementation: string;
  contract: string;
};

type DeployParams = Record<string, PayoutParams>;

export const MerklePayoutParams: DeployParams = {
  mainnet: {
    factory: "0x8F8d78f119Aa722453d33d6881f4D400D67D054F",
    implementation: "0xf166786c1b49395F0300e52E8479712B0089FA65",
    contract: "",
  },
  goerli: {
    factory: "0x6fe42aC1C893bC05C413F0C066532D4d5326F347",
    implementation: "0x5ec43245b722E0EAc885c16589f858727b36E147",
    contract: "",
  },
  "optimism-mainnet": {
    factory: "0xB5365543cdDa2C795AD104F4cB784EF3DB1CD383",
    implementation: "0x5d0fAd094C32F14315e4CaCbe7A83a7Cc5beC526",
    contract: "",
  },
  "fantom-mainnet": {
    factory: "0xFA1D9FF7F885757fc20Fdd9D78B72F88B00Cff77",
    implementation: "0x74312931C90bADE2Be38C96A61E2A41B3CE1a581",
    contract: "",
  },
  "fantom-testnet": {
    factory: "0x5b55728e41154562ee80027C1247B13382692e5C",
    implementation: "0xeAe0848c2A2395569cAaf3598cfc06B81b9b92D7",
    contract: "",
  },
  "pgn-mainnet": {
    factory: "0x27efa1C90e097c980c669AB1a6e326AD4164f1Cb",
    implementation: "0xc1a26b0789C3E93b07713e90596Cad8d0442C826",
    contract: "",
  },
  arbitrumGoerli: {
    factory: "0x8F8d78f119Aa722453d33d6881f4D400D67D054F",
    implementation: "0xCF50D794c639D57bA8D6BB8FaE34fBd1B89D7112",
    contract: "",
  },
  arbitrumOne: {
    factory: "0x04b194b14532070F5cc8D3A760c9a0957D85ad5B",
    implementation: "0x5b55728e41154562ee80027C1247B13382692e5C",
    contract: "0xE8536d29e5325cB5cce0c1799caE80D6d0fAFDf3",
  },
  "avalanche-mainnet": {
    factory: "0x27efa1C90e097c980c669AB1a6e326AD4164f1Cb",
    implementation: "0xc1a26b0789C3E93b07713e90596Cad8d0442C826",
    contract: "",
  },
  "fuji-testnet": {
    factory: "0x8F8d78f119Aa722453d33d6881f4D400D67D054F",
    implementation: "0xCF50D794c639D57bA8D6BB8FaE34fBd1B89D7112",
    contract: "",
  },
  mumbai: {
    factory: "0xc1a26b0789C3E93b07713e90596Cad8d0442C826",
    implementation: "0x74c3665540FC8B92Dd06a7e56a51eCa038C18180",
    contract: "",
  },
  polygon: {
    factory: "0xD0e19DBF9b896199F35Df255A1bf8dB3C787531c",
    implementation: "0x7ac74Be34b1A27E48a2525259719F877a57B2Aa4",
    contract: "",
  },
  "zksync-testnet": {
    factory: "0xbA160C13F8F626e3232078aDFD6eD2f2B2289563",
    implementation: "",
    contract: "",
  },
  "zksync-mainnet": {
    factory: "0x41A8F19C6CB88C9Cc98d29Cb7A4015629910fFc0",
    implementation: "",
    contract: "",
  },
  base: {
    factory: "0xF7c101A95Ea4cBD5DA0Ab9827D7B2C9857440143",
    implementation: "0x04b194b14532070F5cc8D3A760c9a0957D85ad5B",
    contract: "",
  },
  scroll: {
    factory: "0x7ac74Be34b1A27E48a2525259719F877a57B2Aa4",
    implementation: "0xc6B90f42Ea395898B4C1B33e5C8Fa351829BCD90",
    contract: "",
  },
  "scroll-sepolia": {
    factory: "0xc1a26b0789C3E93b07713e90596Cad8d0442C826",
    implementation: "0x74c3665540FC8B92Dd06a7e56a51eCa038C18180",
    contract: "0xE5fC63716272DF418b247d1Db72f260a2d4b3d90",
  },
};

// TODO: Update this file any time a new dummy voting contract has been deployed
export const DirectPayoutParams: DeployParams = {
  mainnet: {
    factory: "0xd07D54b0231088Ca9BF7DA6291c911B885cBC140",
    implementation: "0x3D77E65aEA55C0e07Cb018aB4Dc22D38cAD75921",
    contract: "",
  },
  goerli: {
    factory: "0x9c88730986A07223176fCaaC2Dd8214B9a286780",
    implementation: "0x7C9C52f09a1A362a1F0f7cd0EaCCAFEe38e6111b",
    contract: "",
  },
  "pgn-mainnet": {
    factory: "0x0c33c9dEF7A3d9961b802C6C6402d306b7D48135",
    implementation: "0x9A606A7E4A2eeD3649C1830A8c5B90cDB9859e9c",
    contract: "",
  },
  "pgn-sepolia": {
    factory: "0x3D77E65aEA55C0e07Cb018aB4Dc22D38cAD75921",
    implementation: "0xC3A195EEa198e74D67671732E1B8F8A23781D735",
    contract: "",
  },
  "optimism-mainnet": {
    factory: "0x2Bb670C3ffC763b691062d671b386E51Cf1840f0",
    implementation: "0x534d2AAc03dCd0Cb3905B591BAf04C14A95426AB",
    contract: "",
  },
  "fantom-mainnet": {
    factory: "0x9B1Ee60B539a3761E328a621A3d980EE9385679a",
    implementation: "0xf78DCed8BA0baAeb982D068b786588d6B8D181cd",
    contract: "",
  },
  "fantom-testnet": {
    factory: "0x8eC471f30cA797FD52F9D37A47Be2517a7BD6912",
    implementation: "0xE1c5812e9831bc1d5BDcF50AAEc1a47C4508F3fA",
    contract: "",
  },
  arbitrumGoerli: {
    factory: "0xCd3618509983FE4990D7770CF6f02c7145dC365F",
    implementation: "0xE1F4A28299966686c689223Ee7803258Dbde0942",
    contract: "",
  },
  arbitrumOne: {
    factory: "0xc1a26b0789C3E93b07713e90596Cad8d0442C826",
    implementation: "0x74c3665540FC8B92Dd06a7e56a51eCa038C18180",
    contract: "",
  },
  "avalanche-mainnet": {
    factory: "0x8AdFcF226dfb2fA73788Ad711C958Ba251369cb3",
    implementation: "0xD9B7Ce1F68A93dF783A8519ed52b74f5DcF5AFE1",
    contract: "",
  },
  "fuji-testnet": {
    factory: "0x0F98547e09D41e3c82086fC5Eb0E42Ab786aA763",
    implementation: "0x64ab6F2E11dF8B3Be5c8838eDe3951AC928daE9C",
    contract: "",
  },
  mumbai: {
    factory: "0xD9B7Ce1F68A93dF783A8519ed52b74f5DcF5AFE1",
    implementation: "0xD0e19DBF9b896199F35Df255A1bf8dB3C787531c",
    contract: "",
  },
  polygon: {
    factory: "0xF2a07728107B04266015E67b1468cA0a536956C8",
    implementation: "0xc7722909fEBf7880E15e67d563E2736D9Bb9c1Ab",
    contract: "",
  },
  "zksync-testnet": {
    factory: "0x4170665B31bC10009f8a69CeaACf3265C3d66797",
    implementation: "",
    contract: "",
  },
  "zksync-mainnet": {
    factory: "0x0ccdfCB7e5DB60AAE5667d1680B490F7830c49C8",
    implementation: "",
    contract: "",
  },
  base: {
    factory: "0x74c3665540FC8B92Dd06a7e56a51eCa038C18180",
    implementation: "0x8AdFcF226dfb2fA73788Ad711C958Ba251369cb3",
    contract: "",
  },
  scroll: {
    factory: "0xc7722909fEBf7880E15e67d563E2736D9Bb9c1Ab",
    implementation: "0x8eC471f30cA797FD52F9D37A47Be2517a7BD6912",
    contract: "",
  },
  "scroll-sepolia": {
    factory: "0xD9B7Ce1F68A93dF783A8519ed52b74f5DcF5AFE1",
    implementation: "0xD0e19DBF9b896199F35Df255A1bf8dB3C787531c",
    contract: "",
  },
};
