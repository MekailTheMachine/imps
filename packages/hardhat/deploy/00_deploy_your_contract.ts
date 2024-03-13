import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";
import { Contract } from "ethers";

/**
 * Deploys a contract named "YourContract" using the deployer account and
 * constructor arguments set to the deployer address
 *
 * @param hre HardhatRuntimeEnvironment object.
 */
const deployYourContract: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  /*
    On localhost, the deployer account is the one that comes with Hardhat, which is already funded.

    When deploying to live networks (e.g `yarn deploy --network goerli`), the deployer account
    should have sufficient balance to pay for the gas fees for contract creation.
    You can generate a random account with `yarn generate` which will fill DEPLOYER_PRIVATE_KEY
    with a random private key in the .env file (then used on hardhat.config.ts)
    You can run the `yarn account` command to check your balance in every network.
  */

    
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;

<<<<<<< HEAD
  const Note_Acceptor_contract = await deploy("Note_Acceptor", {
    from: deployer,
    args: ['0x72e4f9f808c49a2a61de9c5896298920dc4eeea9'],
    log: true,
    autoMine: true,
  });

  const verifier_contract = await deploy("Eippy", {
    from: deployer,
    args: ["FundFactory", "1"],
    log: true,
    autoMine: true,
  });
  

  const profile_verifier_contract = await deploy("Profile", {
    from: deployer,
    args: ["Profile", "1"],
    log: true,
    autoMine: true,
  });

  const ffactor = await deploy("FundFactory", {
    from: deployer,
    // Contract constructor arguments
    args: [verifier_contract.address],
    log: true,
    // autoMine: can be passed to the deploy function to make the deployment process faster on local networks by
    // automatically mining the contract deployment transaction. There is no effect on live networks.
    autoMine: true,
  });


  await deploy("FundMy", {
    from: deployer,
    // Contract constructor arguments
    args: [ffactor.address, "0x9EEF30cb89EA5e8502B37Fa08cc3E1892cA00b10", 100, 10000, 10000, 0],
    log: true,
    autoMine: true,
  });

  await deploy("YourContract", {
=======
  await deploy("ImpactEquations", {
>>>>>>> 65f0de4a6c5b42e58bbf25e694655461309edcb3
    from: deployer,
    // Contract constructor arguments
    args: [],
    log: true,
    // autoMine: can be passed to the deploy function to make the deployment process faster on local networks by
    // automatically mining the contract deployment transaction. There is no effect on live networks.
    autoMine: true,
  });

  await deploy("GrantExamp", {
    from: deployer,
    // Contract constructor arguments
    args: [],
    log: true,
    // autoMine: can be passed to the deploy function to make the deployment process faster on local networks by
    // automatically mining the contract deployment transaction. There is no effect on live networks.
    autoMine: true,
  });

  // Get the deployed contract to interact with it after deploying.
  //const yourContract = await hre.ethers.getContract<Contract>("ImpactEquations", deployer);
  //console.log("👋 Initial greeting:", await yourContract.greeting());
};

export default deployYourContract;

// Tags are useful if you have multiple deploy files and only want to run one of them.
// e.g. yarn deploy --tags YourContract
deployYourContract.tags = [];
