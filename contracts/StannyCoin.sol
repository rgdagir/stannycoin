// Create an ERC20 token. The code is modeled after ConsenSys' basic token contract.
// Andrew Tam, 2018

pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";  // make the contract ownable

contract StannyCoin is Ownable {

  uint256 constant private MAX_UINT256 = 2**256 - 1;
  // create balances and allowances
  mapping (address => uint256) public balances;
  mapping (address => mapping (address => uint256)) public allowed;

  // token identifiers
  string public name;
  string public symbol;
  uint8 public decimals = 18;
  uint256 totalSupply;

  // declare events
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

  /*
   * Initialize the contract and give all of the tokens to the creator.
   */
  function StannyCoin() public {
        balances[msg.sender] = 100000;  // give all of the tokens to the creator
        totalSupply = 100000;
        name = "StannyCoin";
        symbol = "STAN";
  }

  /*
   * Transfer tokens to another address.
   */
  function transfer(address _to, uint256 _value) public returns (bool success) {
    require(balances[msg.sender] >= _value);  // check that the sender has enough
    uint previousBalances = balances[msg.sender] + balances[_to];
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    Transfer(msg.sender, _to, _value);
    // the sum of the balances should be the same before and after the transfer
    assert(balances[msg.sender] + balances[_to] == previousBalances);
    return true;
  }

  /*
   *  Transfer tokens from another address.
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    uint256 allowance = allowed[_from][msg.sender];
    require(balances[_from] >= _value && balances[_from] >= allowance);  // check if the owner has enough allowance
    balances[_to] += _value;
    balances[_from] -= _value;
    if (allowance < MAX_UINT256) {
      allowed[_from][_to] -= _value;
    }
    Transfer(_from, _to, _value);
    return true;
  }

  /*
   * Get the token balance of a specific address.
   */
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }

  /*
   * Set the allowance for another address.
   */
  function approve(address _spender, uint256 _value) public returns (bool success) {
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  /*
   * Get the allowance of an owner-spender pair.
   */
  function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
    return allowed[_owner][_spender];
  }


}
