//SPDX-License-Identifier : MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
//Import ERC20 Contract from OpenZeppelin

contract RenTokenFixedSupply  is ERC20 {

   //we also want to call the constructor present inside ERC20
    constructor() ERC20("Fixed", "FIX") {
         _mint(msg.sender, 1000000 * (10**18)); //msg.sender is the person minting the token, this action will mint a 1000 tokens to my address
    }
    function buyToken(address receiver) public payable returns (bool) {
        require(msg.value >= 0, "You cannot mint pd with zero ETH");
        uint256 amount = msg.value/10**18 * 1000;
        _mint(receiver, amount);
        return true ;
    }
}
