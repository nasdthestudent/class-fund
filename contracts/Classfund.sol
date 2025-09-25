/**
 *Submitted for verification at Etherscan.io on 2025-09-16
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Classfund{
    address public treasurer;
    uint public currentPeriod;

    mapping(address => bool) public isMember;
    mapping(address => uint) public totalContributions;
    mapping(address => mapping(uint => uint)) public contributionsByPeriod;


    constructor(address[] memory _members){
        treasurer = msg.sender;
        for(uint i = 0; i < _members.length; i++){
            isMember[_members[i]] = true;
        }
        currentPeriod += 1;

    }

    modifier onlyTreasurer(){
        require(msg.sender == treasurer, "Only treasurer can call this function");
        _;
    }

    function addMembers(address[] memory _newMembers) public onlyTreasurer{
        for(uint i = 0; i < _newMembers.length; i++){
            isMember[_newMembers[i]] = true;
        }
    }

    function removeMembers(address _members) public onlyTreasurer{
        isMember[_members] = false;
    }

    function pay() public payable{
        require(msg.value > 0, "Payment must be greater than 0");
        contributionsByPeriod[msg.sender][currentPeriod] += msg.value;
        totalContributions[msg.sender] += msg.value;
        emit Paid(msg.sender, msg.value, block.timestamp);
    }

    function withdraw(uint _withdrawAmount) public onlyTreasurer{
        require(_withdrawAmount <= address(this).balance, "Insufficient balance");
        (bool success, ) = payable(treasurer).call{value: _withdrawAmount}("");
        require(success, "Transfer failed");
        emit Withdrawn(msg.sender, _withdrawAmount, block.timestamp);

    }

    function nextPeriod() public onlyTreasurer{
        currentPeriod++;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    event Paid(address indexed from, uint amount, uint timestamp);
    event Withdrawn(address indexed to, uint amount, uint timestamp);
}