// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract ElectionDapp {
    bytes32 private merkleRoot;
    address public admin;
    ERC20 public voxToken;
    uint40 public startTime;
    uint40 public endTime;

    error Unauthorized();
    error BlackListed();

    struct VoterDetails {
        string firstName;
        string middleName;
        string lastName;
        uint40 dateOfDate;
        uint40 age;
        uint40 votingTime;
        bool voted;
    }

    mapping(address => bool) public isBlackListed;
    mapping(address => VoterDetails) public isAVoter;

    constructor(address _VoxTokenContractAddress) {
        admin = msg.sender;
        voxToken = ERC20(_VoxTokenContractAddress);
    }

    function setElectionDetails(
        bytes32 _merkleroot,
        uint40 _startTime,
        uint40 _endTime
    ) public {
        merkleRoot = _merkleroot;
        startTime = _startTime;
        endTime = uint40(block.timestamp + startTime + _endTime);
    }

    function vote(bytes32[] calldata _merkleProof) public {
        VoterDetails storage vd = isAVoter[msg.sender];

        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        if (MerkleProof.verify(_merkleProof, merkleRoot, leaf)) {
            if (vd.votingTime < endTime) {
                vd.voted = true;
            }
            revert Unauthorized();
        }
    }

    function addBlackList(address badVoter) external {
        if (badVoter == address(0x0)) {
            revert("Voter is not register");
        }
        if (!isBlackListed[badVoter]) {
            isBlackListed[badVoter] = true;
        }
        revert BlackListed();
    }

    function updateAdmin(address newAdmin) external {
        assert(newAdmin != address(0x0));
        admin = newAdmin;
    }
}
