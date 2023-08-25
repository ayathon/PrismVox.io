# PrismVox Dapp

<p align="center" width="100%">
  <img src="https://github.com/ayathon/PrismVox.io/assets/58889001/d53f821d-f3fb-4753-9f08-8b379111b797" alt="site"/>
</p>

> ## Table of contents
- [Overview](#overview)
- [Core Features Implemented](#core-features-implemented)
- [Technologies](#technologies)
- [Repo Setup](#repo-setup)
- [Requirements](#requirements)
- [Setup the Project](#setup-the-project)
  - [Install Hardhat](#install-hardhat)
  - [Env Setup](#env-setup)
  - [Setup Hardhat.config](#setup-hardhatconfig)
- [Create the SmartContract](#create-the-smartcontract)
  - [Compile](#compile)
  - [Deploy](#deploy)
  - [Verify](#verify)
- [Setup the Frontend](#setup-the-frontend)
  - [Install Dependencies](#install-dependencies)
  - [Steps to host the live site on Vercel](#steps-to-host-the-live-site-on-vercel)
- [Testing the Smartcontract](#testing-the-smartcontract)
- [PrismVox Contract Address](#PrismVox-contract-address)
- [Live Link](#live-link)
- [Contributors](#contributors)
- [Contributing to the project](#contributing-to-the-project)
#
> ## Overview
<p align="justify">
 Welcome to PrismVox — where every voice shines brightly. Designed for DAOs, communities, and all seeking democratic innovation. 
</p>


#
> ## Core Features Implemented

`Deployment on a faster network`
- Deployment on polygon for speed, gas fees & optimization.




`Setup elections and compile votes`
- Restrict the power to set up and compile votes to only the super admin and stakeholders.
- Ability to set up multiple elections at the same time.
- Restrict the ability for anyone who isn't a stakeholder to vote.
- Ability for eligible stakeholders to vote for candidates in different election categories simultaneously.
- Ability to limit stakeholders from voting in specific elections, for example stakeholdern can't vote in an election for board of directors.
- Ability to register candidates to contest for specific roles.
- Restrict stakeholders from voting multiple times for different candidates in the same category.
- Check to prevent users from voting for a candidate that doesn't exist for that category.
- Ability for stakeholder to view history of past elections.
- Ability for the superadmin to view the election queue.
- Restrict the start and end of a voting session to only the super admin.
- Ability to compile votes for different election categories.
- Ability for the super admin, and directors to make the election results public.
- Restrict the ability of the stakeholder to view the election results until it is made public.

`Remove super admin`
- Ability to change the current super admin based on a consensus of above 75% vote from the board of directors.

`Security`
- Ability for the superadmin to pause and unpause the contract for security reasons. 
- If there's a vulnerability or a security breach, the contract functionality can be paused so the vulnerability can't be abused until the problem has been resolved.

`Test Coverage`
- Unit testing ensures that all the codes meet the quality standards and the functions return the expected output.
- Test coverage shows us the extent of how much of our codes are covered by tests. We ideally aim for 100% coverage.

`Natspec commenting`
- This documentation provides information about the codebase and their implementation for both technical and non technical people. 


</p>

#
> ## Technologies
| <b><u>Stack</u></b> | <b><u>Usage</u></b> |
| :------------------ | :------------------ |
| **`Solidity`**      | Smart contract      |
| **`React JS`**      | Frontend            |

#
> ## Repo Setup

<p align="justify">
To setup the repo, first fork the PrismVox.io Dapp, then clone the forked repository to create a copy on the local machine.
</p>

    $ git clone https://github.com/ayathon/PrismVox.io

<p align="justify">
Change directory to the cloned repo and set the original PrismVox.io repository as the "upstream" and your forked repository as the "origin" using gitbash.
</p>

    $ git remote add upstream https://github.com/ayathon/PrismVox.io.git

#

> ## Requirements
#
- Hardhat
- Alchemy key
- Metamask key
- Polygonscan.com API Url
- Node JS
#
> ## Setup the Project
**`*Note:`**

<p align="justify">
This project was setup on a windows 10 system using the gitbash terminal. Some of the commands used may not work with the VScode terminal, command prompt or powershell.
</p>

The steps involved are outlined below:-
#
> ### Install Hardhat
The first step involves cloning and installing hardhat.
```shell
$ cd vox-solidity

$ npm i -D hardhat

$ npm install

$ npm install --save-dev "@nomiclabs/hardhat-waffle" "ethereum-waffle" "chai" "@nomiclabs/hardhat-ethers" "ethers" "web3" "@nomiclabs/hardhat-web3" "@nomiclabs/hardhat-etherscan" "@openzeppelin/contracts" "dotenv" "@tenderly/hardhat-tenderly" "hardhat-gas-reporter" "hardhat-deploy"
```
> ### Env Setup
 Next create a `.env` file by using the sample.env. Retrieve your information from the relevant sites and input the information where needed in the `.env` file.

`To retrieve your metamask private key.`
- Open your account details by clicking on the three dots on the metamask extension on your chrome browser
- Click on export private key
- Verify your password
- Copy your private key and place it in the .env file

<p align="center" width="100%">
  <img src="https://drive.google.com/uc?export=view&id=1oDl0IbicD7LhNOcYUbGzBYTJdduWim1t" alt="metamask"/>
</p>

#
`To retrieve your alchemy key.`
- Login to your account on [alchemy](https://www.alchemy.com/)
- Once you're redirected to your [dashboard](https://dashboard.alchemyapi.io/), click on create app.
- Fill in the relevant details especially the chain and network
- Once the app has been created, click on view key.
- Copy the HTTP and place it in the .env file.

<p align="center" width="100%">
  <img src="https://drive.google.com/uc?export=view&id=1vPvT5LJRJy6B8hSi_3mPo16wC4u6MnEK" alt="alchemy"/>
  
</p>

#
`To retrieve your polygonscan key.`
- Login to [polygonscan](https://polygonscan.com/) and hover over the dropdown arrow for your profile on the navbar.
- Click on API keys and add to create a new project (optional step).
- Once the project has been created, click on the copy button to copy the API key.
- Paste it in the .env file

<p align="center" width="100%">
  <img src="https://drive.google.com/uc?export=view&id=1x1h2DqgWNGFzx47sNAVY0uUk_WaJx3wi" alt="polygon key"/>
</p>

#
> ### Setup Hardhat.config


Below is the setup for the hardhat.config.json

<p align="center" width="100%">
  <img src="https://drive.google.com/uc?export=view&id=1-vWH8_zI8DTzvnRM4gcwX2HWsHuCd0O0" alt="hardhat"/>
</p>

#
> ## Create the SmartContract
  - First write the Smartcontract codes within the contracts folder.
  - The next step involves the compilation, deployment and verification of the contract on the testnet.

> ### Compile
- To compile the smartcontract before deployment:
```
$ npx hardhat compile
```
#
> ### Deploy
- To deploy the smartcontract:
```
$ npx hardhat run scripts/deploy.js --network mumbai
```
#
> ### Verify
- To verify the smartcontract:
```
$ npx hardhat verify 0xD6c7Bc7089DBe4DC6D493E35eaC3dAf5b18FC04d 0xC291B856723080177f983CB32C275D1e56f91841 --network mumbai
```
- Note for verificition, the first address is the VoxToken address, while the second is the PrismVox address. but this address will be changed soon

#
> ## Setup the Frontend
- First run the frontend on your local server to ensure it's fully functional before building for production.
#
> ### Install Dependencies
- Setup and install dependencies

```shell
$ cd frontend

$ npm install

$ npm run dev
```
> ### Steps to host the live site on Vercel
- Create an account on [vercel](https://vercel.com/) and authorize your [GitHub](https://github.com/ayathon/PrismVox.io) account.

- Once you're redirected to the Dashboard, click on the drop down menu and select `Add GitHub Org or Account`.

- In the pop-up window, select the install option.

- Once installation is completed, return to the dashboard and click `new project`.

- Select the TeamB organization and select the zurischool repo to import the project.

- Enter the relevant details and click `Deploy`.


#
> ## Testing the Smartcontract

- Coverage is used to view the percentage of the code required by tests and unittests were implemented to ensure that the code functions as expected
#
**`Coverage Test`**
- To test the smartcontract, first open a terminal and run the following command:

- First install Solidity Coverage
```
  $ npm i solidity-coverage
```
- Add `require('solidity-coverage')` to hardhat.config.json

- Install Ganache
``` 
  $ npm i ganache-cli
``` 
- Run coverage
```
$ npx hardhat coverage --network localhost

# if you get errors and you want to trace the error in the terminal
$ npx hardhat coverage --network localhost --show-stack-traces
```
#

<p align="center" width="100%">
  <img src="https://drive.google.com/uc?export=view&id=16zXW2QHBBinyC0adq1Cd41YUD1grjR1X" alt="coverage tests"/>
</p>


#
> ## vox-solidity Contract Address

- https://mumbai.polygonscan.com/address/
# 



> ## Live Link
  
- 
#

> ## Contributors

This Project was created by these awesome dedicated members

<p align="center" width="100%">
  <img src="https://github.com/ayathon/PrismVox.io/assets/58889001/7d979ac6-387f-4ae1-a4f6-1677e556661e" alt="teamVox"/>
</p>

#
> ## Contributing to the project

If you find something worth contributing, please fork the repo, make a pull request and add valid and well-reasoned explanations about your changes or comments.

Before adding a pull request, please note:

- This is an open source project.
- Your contributions should be inviting and clear.
- Any additions should be relevant.
- New features should be easy to contribute to.

All **`suggestions`** are welcome!
#
> ##### README Created by `Enebeli Emmanuel` for TeamVox
