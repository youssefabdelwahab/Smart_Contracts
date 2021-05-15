pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable HR = msg.sender;
    address payable employee_one; 
    address payable employee_two; 
    address payable employee_three;
    
    mapping (address => uint) balances; 


    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint points = msg.value /100;
        uint amount = points * 60;
        uint total = amount; 

        // @TODO: Transfer the amount to each employee
        // Your code here!
        employee_one.transfer(amount);
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount);
        amount = points * 15; 
        total += amount;
        employee_three.transfer(amount);
 
        

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        // Your code here!
        uint remainder = (msg.value - total);
    
        employee_one.transfer(remainder);
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        // Your code here!
        uint points = msg.value / 100;
        uint amount = points * 60;
        uint total = amount; 

        // @TODO: Transfer the amount to each employee
        // Your code here!
        employee_one.transfer(amount);
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount); 
        amount = points * 15;
        total += amount;
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        // Your code here!
        uint remainder = (msg.value - total);
        employee_one.transfer(remainder);
    }
}
