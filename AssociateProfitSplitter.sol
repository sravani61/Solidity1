pragma solidity ^0.5.0;

contract AssociateProfitSplitter{
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    address payable owner = msg.sender;
    
    constructor (address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two= _two;
        employee_three = _three;
    }
    
    function Balance() public view returns (uint){
        return msg.sender.balance;
    }
    
    function Deposit() public payable{
        require(msg.sender == owner);
        uint amount = msg.value/3;
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
        
        msg.sender.transfer(msg.value-(amount * 3));
    }
    
    function() external payable{
        Deposit();
    }
    
}








