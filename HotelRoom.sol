pragma solidity ^0.6.0;

contract HotelRoom {
    
    enum Statuses {Vacant, Occupied}
    Statuses currentStatus;
    
    address payable public owner;
    
    event Occupy(address _occupant, uint _value);

    constructor() public {
        owner = msg.sender;
        currentStatus = Statuses.Vacant;
    }
    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Occupied, "Currently Occupied");
        _;
    }
    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough ether provided");
        _;
    }
    
    receive() external payable onlyWhileVacant costs(2 ether) {
        owner.transfer(msg.value);
        currentStatus = Statuses.Occupied;
        emit Occupy(msg.sender, msg.value);
    }
}