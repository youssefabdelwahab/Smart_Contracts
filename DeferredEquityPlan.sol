pragma solidity ^0.5.0;

contract DeferredEquityPlan {
    uint fakenow = now;
    address human_resources;

    address payable employee; // bob
    bool active = true; // this employee is active at the start of the contract

    uint total_shares = 1000; 
    uint annual_distribution = 250;

    uint start_time = fakenow; 

    uint unlock_time = fakenow ;

    uint public distributed_shares; // starts at 0

    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

    function distribute() public payable {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");

        require(unlock_time <= fakenow , 'You cant get more shares at the moment'); 
        require(distributed_shares < total_shares , 'You are only allowed 1000 shares'); 
        
        uint shares = msg.value; 
        employee.transfer(shares);

        unlock_time += 365 days;

        distributed_shares = ((fakenow - start_time) / 365 ) * annual_distribution; 
        
        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }

    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }
    
    // function fastforward() public { 
    //     fakenow += 100 days; 
    // }

    function() external payable {
        revert("Do not send Ether to this contract!");
    }
}
