// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract IdentityVerification {
    struct Identity {
        string userID;
        string publicKey;
        bool verified;
    }

    mapping(string => Identity) identities;

    event IdentityRegistered(string userID, string publicKey);
    event IdentityVerified(string userID);

    function registerIdentity(string memory userID, string memory publicKey) public {
        identities[userID] = Identity(userID, publicKey, false);
        emit IdentityRegistered(userID, publicKey);
    }

    function verifyIdentity(string memory userID) public {
        identities[userID].verified = true;
        emit IdentityVerified(userID);
    }

    function getIdentityStatus(string memory userID) public view returns (bool) {
        return identities[userID].verified;
    }
}
