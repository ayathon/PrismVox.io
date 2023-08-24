//SPDX-License-Identifier:MIT
pragma solidity 0.8.9;

//import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
//import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
//import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";


contract prismVox{


    

   // function intialize() initializer public {
    //    startElection(_startTime, _endTime);
    //    __UUPSUpgradeable_init();
     //   __Pausable_init();
    //}

    //===================>>===================>>=================>>====================>>

    struct Voter {
        string firstName;
        string lastName;
        uint256 dateOfBirth;
        bool isRegistered;
        bool isIDVerified;
    }

    struct Candidate {
        string firstName;
        string lastName;
        uint256 dateOfBirth;
        string description;
        string picture;
        uint256 voteCount;
    }

    struct Election {
        uint256 startTime;
        uint256 endTime;
        bool isActive;
    }

    mapping(address => Voter) public voters;
    Candidate[] public candidates;
    Election public currentElection;

    modifier onlyRegisteredVoter() {
        require(voters[msg.sender].isRegistered, "You are not a registered voter");
        _;
    }

    modifier onlyDuringElection() {
        require(currentElection.isActive, "Election is not active");
        require(block.timestamp >= currentElection.startTime && block.timestamp <= currentElection.endTime, "Election is not within the specified timeframe");
        _;
    }

    event VoterRegistered(address indexed voter);
    event CandidateRegistered(string firstName, string lastName);
    event VoteCasted(address indexed voter, string candidateFullName);
    event ElectionStarted(uint256 startTime, uint256 endTime);
    event WinnerAnnounced(string firstName, string lastName);


    function registerVoter(string memory _firstName, string memory _lastName, uint256 _dateOfBirth) external {
        require(!voters[msg.sender].isRegistered, "You are already a registered voter");
        voters[msg.sender] = Voter({
            firstName: _firstName,
            lastName: _lastName,
            dateOfBirth: _dateOfBirth,
            isRegistered: true,
            isIDVerified: false
        });

        emit VoterRegistered(msg.sender);
    }
    
    //function verifyID(address _from) external onlyRegisteredVoter {
    //   bool isVerified = simulateIDVerification(msg.sender,_from);
    //    require(isVerified, "ID verification failed");

    //   voters[msg.sender].isIDVerified = true;
    //}

    function Candidate_reg(
        string memory _firstName,
        string memory _lastName,
        uint256 _dateOfBirth,
        string memory _description,
        string memory _picture
    ) external{
        candidates.push(Candidate({
            firstName: _firstName,
            lastName: _lastName,
            dateOfBirth: _dateOfBirth,
            description: _description,
            picture: _picture,
            voteCount: 0
        }));

        emit CandidateRegistered(_firstName, _lastName);
    }

    function startElection(uint256 _startTime, uint256 _endTime) public {
        require(!currentElection.isActive, "Election is already active");
        require(_startTime >= block.timestamp, "Start time must be in the future");
        require(_endTime > _startTime, "End time must be after start time");

        currentElection = Election({
            startTime: _startTime,
            endTime: _endTime,
            isActive: true
        });

        emit ElectionStarted(_startTime, _endTime);
    }

    function castVote(uint256 _candidateIndex) external onlyRegisteredVoter onlyDuringElection {
        require(_candidateIndex < candidates.length, "Invalid candidate index");

        candidates[_candidateIndex].voteCount++;

        emit VoteCasted(msg.sender, string(abi.encodePacked(candidates[_candidateIndex].firstName, " ", candidates[_candidateIndex].lastName)));
    }

    function announceWinner() external onlyDuringElection {
        require(!currentElection.isActive, "Election is still active");
        require(candidates.length > 0, "No candidates registered");

        uint256 winningVoteCount = 0;
        uint256 winningCandidateIndex;

        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > winningVoteCount) {
                winningVoteCount = candidates[i].voteCount;
                winningCandidateIndex = i;
            }
        }

        emit WinnerAnnounced(candidates[winningCandidateIndex].firstName, candidates[winningCandidateIndex].lastName);
    }

   
   // function simulateIDVerification(address _voterAddress, address _from) private returns (bool) {
    //    if (_voterAddress == msg.sender|| _voterAddress == _from) {
   //         return true;
     //   }
      //  return false;
    //}
}
