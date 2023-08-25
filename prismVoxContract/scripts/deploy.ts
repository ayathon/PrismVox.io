import { ethers } from "hardhat";

async function main() {
 

  const electionType = "Presidential";
  const votingAge = 18;

  const election = await ethers.deployContract("prismVox", [electionType, votingAge]);

  await election.waitForDeployment();

  console.log(
    "election ",election
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
