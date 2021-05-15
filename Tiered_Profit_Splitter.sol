pragma solidity ^0.5.0;


contract AssociateProfitSplitter {
    address payable HR = msg.sender;
    address payable employee_one; 
    address payable employee_two; 
    address payable employee_three;
    
    


    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value /100;
        uint amount = points * 60;
        uint total = amount; 

        employee_one.transfer(amount);
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount);
        amount = points * 15; 
        total += amount;
        employee_three.transfer(amount);
 
        

        uint remainder = (msg.value - total);
    
        employee_one.transfer(remainder);
    }

    function() external payable {
        uint points = msg.value / 100;
        uint amount = points * 60;
        uint total = amount; 

        employee_one.transfer(amount);
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount); 
        amount = points * 15;
        total += amount;
        employee_three.transfer(amount);
        
        uint remainder = (msg.value - total);
        employee_one.transfer(remainder);
    }
}
