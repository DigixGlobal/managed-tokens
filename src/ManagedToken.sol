contract Token {
  function approve(address _spender,uint256 _value) returns(bool success);
  function totalSupply() constant returns(uint256 );
  function transferFrom(address _from,address _to,uint256 _value) returns(bool success);
  function balanceOf(address _owner) constant returns(uint256 balance);
  function transfer(address _to,uint256 _value) returns(bool success);
  function allowance(address _owner,address _spender) constant returns(uint256 remaining);
}

contract DepositAddress {

  address public owner;
  address public tokenContract;

  modifier ifOwner() {
    if (owner != msg.sender) {
      throw;
    } else {
      _
    }
  }

  function DepositAddress(address _tokencontract) {
    owner = msg.sender;
    tokenContract = _tokencontract;
  }

  function balance() public constant returns (uint256 mybalance) {
    mybalance = Token(tokenContract).balanceOf(address(this));
    return mybalance;
  }

  function sweep() ifOwner returns (bool success, uint256 amount) {
    amount = balance();
    if (Token(tokenContract).transfer(owner, amount)) {
      success = true;
    } else {
      success = false;
    }
    return (success, amount);
  }

}

contract ManagedToken {

  mapping (bytes32 => address) public depositAddresses;  
  address public owner;
  address public tokenContract;

  event Sweep(bytes32 indexed _id, uint256 indexed _amount); 
  event Withdraw(bytes32 indexed _id, address indexed _to, uint256 indexed _amount);

  modifier ifOwner() {
    if (owner != msg.sender) {
      throw;
    } else {
      _
    }
  }

  function ManagedToken(address _tokencontract) {
    owner = msg.sender; 
    tokenContract = _tokencontract;
  }

  function createDepositAddress(bytes32 _id) ifOwner returns (bool success) {
    if (depositAddresses[_id] == 0x0) {
      depositAddresses[_id] = new DepositAddress(tokenContract);
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  function balanceOf(bytes32 _id) public constant returns (uint256 balanceof) {
    balanceof = Token(tokenContract).balanceOf(depositAddresses[_id]);
    return balanceof;
  }

  function balance() public constant returns (uint256 mybalance) {
    mybalance = Token(tokenContract).balanceOf(address(this));
    return mybalance;
  }
  
  function sweep(bytes32 _id) ifOwner returns (bool success) {
    uint256 amount;
    (success, amount) = (DepositAddress(depositAddresses[_id]).sweep());
    Sweep(_id, amount);
    return success;
  }

  function getDepositAddress(bytes32 _id) public constant returns (address depositaddress) {
    depositaddress = depositAddresses[_id];
    return depositaddress;
  }

  function setOwner(address _newowner) ifOwner returns (bool success) {
    owner = _newowner;
    success = true;
    return success;
  }

  function withdraw(bytes32 _id, address _to, uint256 _amount) ifOwner returns (bool success) {
    if (Token(tokenContract).transfer(_to, _amount)) {
      success = true;
      Withdraw(_id, _to, _amount);
    } else {
      success = false;
    }
    return success; 
  }
  
}
