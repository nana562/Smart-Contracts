// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
 
contract Mortal {
    /* Define variable owner of the type address*/
    address owner;
 
    /* this function is executed at initialization and sets the owner of the contract */
    constructor() { owner = msg.sender; }
 
    /* Function to recover the funds on the contract */
    function kill() public { 
        require(msg.sender == owner, "Only owner can kill contract");
        selfdestruct(payable(owner));
    }
}
 
contract Greeter is Mortal {
    /* define variable greeting of the type string */
    string greeting;
 
    /* this runs only once, when the contract is initialized */
    constructor(string memory _greeting) Mortal() {
        greeting = _greeting;
    }
 
    function newGreeting(string memory _greeting) public {
        greeting = _greeting;
    }
 
    /* main function */
    function greet() public view returns (string memory) {
        return greeting;
    }
}
