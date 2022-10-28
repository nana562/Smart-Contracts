
//A faucet is a relatively simple thing: it gives out ether to any address that asks, and can be refilled periodically


pragma solidity ^0.4.19;

contract Faucet{

    //Give out ether to anyone who asks
    function withdraw(uint withdrawAmount) public{
        //Limit withdrawal amount
        require(withdrawAmount <= 1000000000000000000);

        //Send the amount to the address that requested it
        msg.sender.transfer(withdrawAmount);
    }
    //Accept any incoming amount
    function () public payable{}
}
