pragma solidity ^0.4.22;

contract Election {
        string public candidate;
    // Constructor. Declare public since its gonna be run on deployment
    function Election () public {
            candidate = "Raila";
    }
}
