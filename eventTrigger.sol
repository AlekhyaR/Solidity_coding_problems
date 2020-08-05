pragma solidity ^0.6.0;

contract ItemManager {
    
    enum SupplyChainState {Created, Paid, Delivered}
    struct S_Item {
        string _identifier;
        uint _itemPrice;
        ItemManager.SupplyChainState _state;
    }
    
    mapping (uint => S_Item) public items;
    uint ItemIndex;
    
    event SupplyChainSteps(uint _itemIndex, uint _step);
    
    
    function createItem(string memory _identifier, uint _itemPrice) public {
        items[ItemIndex]._identifier = _identifier;
        items[ItemIndex]._itemPrice = _itemPrice;
        items[ItemIndex]._state = SupplyChainState.Created;
        
        emit SupplyChainSteps(ItemIndex, uint(items[ItemIndex]._state));
        ItemIndex ++;
    }
    
    function triggerPayment(uint _itemIndex) public payable{
        require(items[_itemIndex]._itemPrice == msg.value, "Only full payment");
        require(items[_itemIndex]._state == SupplyChainState.Created, "Item has to be created");
        items[_itemIndex]._state = SupplyChainState.Paid;
        
        emit SupplyChainSteps(ItemIndex, uint(items[ItemIndex]._state));
    }
    function triggerDelivery(uint _itemIndex) public {
        require(items[_itemIndex]._state == SupplyChainState.Paid, "Payment has to be made");
        items[_itemIndex]._state = SupplyChainState.Delivered;
        
        emit SupplyChainSteps(ItemIndex, uint(items[ItemIndex]._state));
    }
}
