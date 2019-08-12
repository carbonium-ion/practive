pragma solidity ^0.5.0;

contract HelloBlockchain
{
     //Set of States
    enum StateType { Request, Respond}

    // Model a candidate
	struct Candidate{
		uint id; // unsigned integer
		string name;
		uint VoteCount;
	}

	// Read/write Candidates
    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;

    // private function because we only want to call it inside the contract.
	function addCandidate (string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

    //List of properties
    StateType public  State;
    address public  Requestor;
    address public  Responder;

    string public RequestMessage;
    string public ResponseMessage;

    event StateChanged(string stateData);

    // constructor function
    constructor(string memory message) public
    {
        Requestor = msg.sender;
        RequestMessage = message;
        State = StateType.Request;

        emit StateChanged('Request');

        addCandidate("Raghav");
        addCandidate("Arora");

    }

    // call this function to send a request
    function SendRequest(string memory requestMessage) public
    {
        if (Requestor != msg.sender)
        {
            revert();
        }

        RequestMessage = requestMessage;
        State = StateType.Request;
    }

    // call this function to send a response
    function SendResponse(string memory responseMessage) public
    {
        Responder = msg.sender;

        // call ContractUpdated() to record this action
        ResponseMessage = responseMessage;
        State = StateType.Respond;

        emit StateChanged('Response');
    }
}