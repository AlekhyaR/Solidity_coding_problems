pragma solidity ^0.6.1;

contract MappingContract {
    
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    mapping(address => mapping(uint => Book)) public myBooks;
    
    struct Book {
        string title;
        string author;
    }
    
    constructor() public {
        names[1] = "Hi";
        names[2] = "Sanjay";
        names[3] = "Minion";
    }
    
    
    function addBook(uint _id, string memory _title, string memory _author) public {
         books[_id] = Book(_title, _author);
    }
    
    function addMyBooks(uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}