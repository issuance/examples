pragma solidity ^0.4.24;

import "@abacusprotocol/components/library/instruments/AbacusERC20Token.sol";

/**
 * @dev A token that checks if the user has passed Abacus's KYC checks.
 */
contract MyKYCToken is AbacusERC20Token {
    uint8 public constant decimals = 18;
    uint256 public constant INITIAL_SUPPLY = 1000000000000000000 * (10 ** uint256(decimals));

    constructor(
        ComplianceCoordinator _complianceCoordinator,
        uint256 _complianceProviderId
    ) AbacusERC20Token(_complianceCoordinator, _complianceProviderId) public
    {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }
}
