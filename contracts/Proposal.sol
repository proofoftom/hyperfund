pragma solidity ^0.4.0; // Solidity version this contract was written against, for compatability purposes

// A contract with multiple outcomes, one of which is funded by a vote-with-your-money race
contract Proposal {

  // Funder data type
  struct Funder {
    uint amountStaked; // The amount a user is willing to stake for their outcome
    bool isStaked;     // Is this user already staked on an outcome?
    uint8 outcome;     // The index of the Outcome staked against
  }
  // Outcome data type
  struct Outcome {
    uint totalStaked; // The total amount staked for this outcome
  }

  mapping(address => Funder) funders; // An array of all wallet addresses mapped to Player structs
  Outcome[] outcomes; // An array of Outcomes and the total staked against each

  // Create a new Play with $(_numOutcomes) different outcomes.
  constructor(uint8 _numOutcomes) public {
    outcomes.length = _numOutcomes;
  }

  // Give a stake to outcome $(toOutcome).
  function stake(uint8 _toOutcome, uint _amountToStake) public {
    Funder storage sender = funders[msg.sender];
    // If Funder is already staked or they staked for an invalid outcome, cancel transaction.
    if (sender.isStaked || _toOutcome >= outcomes.length) return;
    // Flag this Funder as staked.
    sender.isStaked = true;
    // Set the outcome that this Funder staked against.
    sender.outcome = _toOutcome;
    // Increment the outcome's stake by the amount the Funder staked.
    outcomes[_toOutcome].totalStaked += _amountToStake;
  }

  // Get the current winning outcome.
  function winningOutcome() public view returns (uint8 _winningOutcome) {
    uint256 winningStake = 0;
    // Loop through the possible outcomes and find the one with the highest stake.
    for (uint8 x = 0; x < outcomes.length; x++)
      if (outcomes[x].totalStaked > winningStake) {
        // Store highest stake.
        winningStake = outcomes[x].totalStaked;
        // Return winning outcome index.
        _winningOutcome = x;
      }
  }
}
