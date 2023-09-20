// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Authentia {
    address payable owner = payable(owner);
    address public buyer;
    string public terms;
    string public product;
    uint256 public price;
    uint256 public accessTime;

    constructor(
        address _buyer,
        string memory _terms,
        string memory _product,
        uint256 _price,
        uint256 _accessTime
    ) {
        owner = payable(msg.sender); // The deployer of the contract is the owner.
        buyer = _buyer;
        terms = _terms;
        product = _product;
        price = _price;
        accessTime = _accessTime;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function confirmPurchase() public payable {
        require(msg.sender == buyer, "Only the buyer can confirm the purchase");
        require(msg.value >= price, "Insufficient funds to complete the purchase");
        require(block.timestamp <= accessTime, "Purchase period has expired");
        owner.transfer(msg.value);
    }

    function getProductDetails() public view returns (string memory, uint256) {
        return (product, price);
    }
}