// SPDX-License-Identifier:MIT

pragma solidity ^0.8.4;

contract P{
    uint value;


    function getValueExternal() external view returns(uint){
        return value;
    }

    function setValue(uint _Value)public{
        value = _Value;
    }

    function getValueInternal()internal view returns(uint){
        return value;
    }

    function getValuePrivate() private view returns(uint){
        return value;
    }

}

contract C is P{
    function getValue()view public returns(uint){
        return getValueInternal();
        // return getValuePrivate(); // Error
    }
}