pragma solidity >=0.4.22 <0.8.0;

contract Election {
    // special data type to hold a candidate
    struct Candidate{
        uint id;
        string politicalParty;
        string name;
        uint voteCount;
    }
    // keep track of number of candidates
    uint public candidatesCount;
    //fetch candidate by id. Consider it a dictionary of candidate objects in Python
    mapping(uint => Candidate) public candidates;
    // keep track of voters
    mapping(address => bool) public voters;
    //trigger event on vote cast
    event votedEvent(uint indexed _candidateId);
    // Constructor. Declare public since its gonna be run on deployment
    constructor () public {
            addCandidate("Raila","One last chance");
            addCandidate("Ruto","Im not like other guys");
            addCandidate("Jayden","Suffering");
    }
    function addCandidate(string memory _name,string memory _party) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,_party,_name,0);
    }
    function vote(uint _candidateId) public {
        // ensure voter has not voted before
        require(!voters[msg.sender]);
        // ensure that you vote for a valid and existing candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        // record voter
        voters[msg.sender] = true;
        //cast a vote
        candidates[_candidateId].voteCount ++;
        // trigger vote event
        votedEvent(_candidateId);
    }
}
