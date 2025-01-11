// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DocumentVerification {
    
    struct Document {
        address owner;
        string documentHash;
        uint256 timestamp;
        bool exists;
        string metadata;
    }


    mapping(string => Document) public documents;


    event DocumentStored(
        address indexed owner, 
        string documentHash, 
        uint256 timestamp
    );

    event DocumentVerified(
        string documentHash, 
        bool isVerified
    );

    function storeDocument(
        string memory _documentHash, 
        string memory _metadata
    ) public {
        
        require(!documents[_documentHash].exists, "Document already exists");

       
        documents[_documentHash] = Document({
            owner: msg.sender,
            documentHash: _documentHash,
            timestamp: block.timestamp,
            exists: true,
            metadata: _metadata
        });

        emit DocumentStored(msg.sender, _documentHash, block.timestamp);
    }

  
    function verifyDocument(string memory _documentHash) 
public 
view 
returns (bool, address, uint256, string memory) {
    Document memory doc = documents[_documentHash];
    

    
    return (
        doc.exists, 
        doc.owner, 
        doc.timestamp,
        doc.metadata
    );
}

  
    function getDocumentOwner(string memory _documentHash) 
    public 
    view 
    returns (address) {
        return documents[_documentHash].owner;
    }
}
