
pragma solidity ^0.6.0;

import "./VotingToken.sol";

contract Airdrop {
    using SafeMath for uint256;
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier ownersPermistion() {
        require(msg.sender == owner, "Only owner can emit tokens!");
        _;
    }
    
    function airdrop(address _tokenAddress, uint256 _amount, address[] memory addresses) public ownersPermistion {
        VotingToken token = VotingToken(_tokenAddress);
        uint256 tokenPerPerson = _amount.div(addresses.length);
         for (uint i = 0; i < addresses.length; i++ ){
            token.transferFrom(msg.sender, addresses[i], tokenPerPerson);
            
        }
    }
}


