pragma solidity ^0.6.0;

contract LoopContract {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    
    address public owner;
    
    constructor() public {
         owner= msg.sender;
    }
    
    function evenNumberCount() public view returns(uint) {
        uint count = 0;
        for(uint i = 0; i < numbers.length; i++) {
            if(isEvenNumber(numbers[i])) {
                count++;
            }
        }
        return count;
    }
    
    function isEvenNumber(uint _number) public view returns(bool) {
      return(_number % 2 == 0);
    }
    
    function isOwner() public view returns(bool) {
        return(msg.sender == owner);
    }
}