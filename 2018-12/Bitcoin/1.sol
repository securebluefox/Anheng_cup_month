pragma solidity ^0.4.23;

contract CoinFlip {  
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  mapping (address => uint) balances;
  

  function CoinFlip() public {
    balances[tx.origin] = 0;
  }

  event FLAG(string b64email, string slogan);
  
  function getbalance() public constant returns (uint){
      return balances[tx.origin];
  }

  function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(block.blockhash(block.number-1));

    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      balances[tx.origin]++;
      return true;
    } else {
      return false;
    }
  }

  function CaptureTheFlag(string b64email) public{
    require (balances[tx.origin]>20);
    emit FLAG(b64email, "Congratulations to capture the flag!");
  }

}