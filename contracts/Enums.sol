pragma solidity ^0.8.0;

contract Proxy_0_8 {
    address public implementation;
    constructor(address _impl) payable {
        replaceImplementation(_impl);
    }

    fallback() external payable {
        if (gasleft() <= 2300) {
            return;
        }

        address impl = implementation;

        bytes memory data = msg.data;
        assembly {
            let result := delegatecall(gas(), impl, add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize()
            let ptr := mload(0x40)
            returndatacopy(ptr, 0, size)
            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }

    function replaceImplementation(address impl) public {
        implementation = impl;
    }
}

contract Logic {
    address public implementation;
    enum DataPoint {
        START,
        GO
    }
    struct DataP {
        DataPoint t;
    }
    DataP public data;

    function setData(DataP memory d) public {
        data = d;
    }

    function getData() public view returns(DataP memory) {
        return data;
    }
}