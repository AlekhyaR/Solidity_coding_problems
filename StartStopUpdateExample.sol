pragma solidity ^0.6.0;

contract StartStopUpdateExample {

  address owner;
  bool public paused;
  constructor() public {
    owner = msg.sender;
  }

  function sendMoney() public payable {
  }
  
  function setPaused(bool _paused) public {
    require(msg.sender == owner, "You are not owner");
    paused = _paused;
  } 

  function withdrawAllMoney(address payable _to) public {
     require(msg.sender == owner, "You cannot withdraw");
     require(!paused, "Contract is paused, currently!");
    _to.transfer(address(this).balance);
  }
  
  function destroySmartContract(address payable _to) public {
     require(msg.sender == owner, "You cannot withdraw");
     selfdestruct(_to);
  }
}
