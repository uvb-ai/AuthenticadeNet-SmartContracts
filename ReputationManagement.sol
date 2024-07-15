// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ReputationManagement {
    struct Transaction {
        string userID;
        string details;
        uint256 timestamp;
    }

    struct Reputation {
        uint256 score;
        uint256 lastUpdated;
    }

    mapping(string => Reputation) reputations;
    mapping(string => Transaction[]) transactions;

    event TransactionRecorded(string userID, string details, uint256 timestamp);
    event ReputationUpdated(string userID, uint256 score);

    function recordTransaction(string memory userID, string memory details) public {
        transactions[userID].push(Transaction(userID, details, block.timestamp));
        emit TransactionRecorded(userID, details, block.timestamp);
    }

    function updateReputation(string memory userID, uint256 score) public {
        reputations[userID] = Reputation(score, block.timestamp);
        emit ReputationUpdated(userID, score);
    }

    function getReputation(string memory userID) public view returns (uint256) {
        return reputations[userID].score;
    }
}
