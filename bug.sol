```solidity
function withdraw(uint amount) public {
    require(balances[msg.sender] >= amount, "Insufficient balance");
    (bool success, ) = msg.sender.call{value: amount}(new bytes(0)); // Bug: No check for success
    require(success, "Transfer failed");
    balances[msg.sender] -= amount;
}
```