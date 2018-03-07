pragma solidity ^0.4.18;

import "./StannyCoin.sol";
import "zeppelin-solidity/contracts/crowdsale/Crowdsale.sol";

contract StannyCoinCrowdsale is Crowdsale {
  function StannyCoinCrowdsale(uint256 _rate, address _wallet, ERC20 _token)
    Crowdsale(_rate, _wallet, _token) {
  }

  function createTokenContract() internal returns(StannyCoin token) {
    return new StannyCoin();
  }

}
