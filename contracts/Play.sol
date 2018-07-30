pragma solidity ^0.4.0; // Solidity version this contract was written against, for compatability purposes.

// A hyper funding of an outcome.
contract Play {

    // Player data type.
  struct Player {
    uint amountStaked; // The amount a user is willing to stake for their play.
    bool isStaked;     // Is this user already staked on an outcome?
    uint8 outcome;     // The index of the Outcome staked against.
  }
  // Outcome data type.
  struct Outcome {
    uint totalStaked; // The total amount staked for this outcome.
  }

  mapping(address => Player) players; // An array of all wallet addresses mapped to Player structs.
  Outcome[] outcomes; // An array of Outcomes and the total staked against each.

  // Create a new Play with $(_numOutcomes) different outcomes.
  constructor(uint8 _numOutcomes) public {
    outcomes.length = _numOutcomes;
  }

  // Give a stake to outcome $(toOutcome).
  function stake(uint8 _toOutcome, uint _amountStaked) public {
    Player storage sender = players[msg.sender];
    // If Player is already staked or they staked for an invalid outcome, cancel transaction.
    if (sender.isStaked || _toOutcome >= outcomes.length) return;
    sender.isStaked = true; // Flag this Player as staked.
    sender.outcome = _toOutcome; // Set the outcome that this Player staked against.
    outcomes[_toOutcome].totalStaked += _amountStaked; // Increment the outcome's stake by the amount the Player staked.
  }

  // Get the current winning outcome.
  function winningOutcome() public view returns (uint8 _winningOutcome) {
    uint256 winningStake = 0;
    // Loop through the possible outcomes and find the one with the highest stake.
    for (uint8 x = 0; x < outcomes.length; x++)
      if (outcomes[x].totalStaked > winningStake) {
        winningStake = outcomes[x].totalStaked; // Store highest stake.
        _winningOutcome = x; // Return winning outcome index.
      }
  }
}
