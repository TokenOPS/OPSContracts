pragma solidity ^0.4.18;

import './ERC20Token.sol';


contract OPSToken is ERC20Token {

    uint256 public constant JointICOBonusAmount = 84000000;
    address public constant JointICOContractAddress = 0x29eC21157f19F7822432e87ef504D366c24E1D8B;
    address public constant OPSPoolAddress = 0xEA5C0F39e5E3c742fF6e387394e0337e7366a121;

    uint256 public  decimalPlace;

    
    function OPSToken() public {
        name = "OPS";
        symbol = "OPS";
        decimals = 18;

        decimalPlace = 10**uint256(decimals);
        totalSupply = 1000000000*decimalPlace;
        distributeTokens();
    }

    function distributeTokens () private {
        balances[OPSPoolAddress] = totalSupply.sub(JointICOBonusAmount.mul(decimalPlace));
        balances[JointICOContractAddress] = JointICOBonusAmount.mul(decimalPlace);
    }

}