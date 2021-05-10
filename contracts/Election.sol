pragma solidity >=0.4.22 <0.8.0;

contract Election {
        string public candidate;
    // Constructor. Declare public since its gonna be run on deployment
    constructor () public {
            candidate = "Raila";
    }
}
