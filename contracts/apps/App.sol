pragma solidity ^0.4.18;

import "./AppStorage.sol";


contract App is AppStorage {
    modifier auth(bytes32 _role) {
        require(canPerform(msg.sender, _role));
        _;
    }

    function canPerform(address _sender, bytes32 _role) public view returns (bool) {
        return address(kernel) == 0 || kernel.hasPermission(_sender, address(this), _role);
    }
}
