import {
    time,
    loadFixture,
  } from "@nomicfoundation/hardhat-toolbox/network-helpers";
  import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
  import { expect } from "chai";
  import { ethers } from "hardhat";
  
  describe("Election Dapp", function () {
    // We define a fixture to reuse the same setup in every test.
    // We use loadFixture to run this setup once, snapshot that state,
    // and reset Hardhat Network to that snapshot in every test.
    async function deployElectionFixture() {
      const electionType = "Presidential";
      const votingAge = 18;
      // Contracts are deployed using the first signer/account by default
      const [owner, otherAccount] = await ethers.getSigners();
  
      const Election = await ethers.getContractFactory("prismVox");
      const election = await Election.deploy(electionType, votingAge);
  
      return { election, owner, otherAccount, electionType, votingAge };
    }
  
    describe("Deployment", function () {
      it("Should set the right type of election", async function () {
        const { election, electionType } = await loadFixture(
          deployElectionFixture
        );
  
        expect(await election.electionType()).to.equal(electionType);
      });
  
        it("Should set the right voting Age", async function () {
          const { election, votingAge } = await loadFixture(deployElectionFixture);
  
          expect(await election.votingAge()).to.equal(votingAge);
        });
  
        it("Should register a voter", async function () {
          const { election, otherAccount} = await loadFixture(
            deployElectionFixture
          );

          const firstName = "uchenna";
          const lastName =  "igwe";
          const age = 25

        const registeredVoter = await election.connect(otherAccount).registerVoter(firstName,lastName, age)
        const aVoter = await registeredVoter.voters()
        console.log("data   ",registeredVoter)
        expect(aVoter.isRegistered).to.equal(true);
        });
  
  
    });
  
  });
  