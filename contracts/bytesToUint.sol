pragma solidity ^0.8.0;

contract bytesToUint {
    function getValues(bytes calldata iAmounts) public pure returns (uint64[] memory returnValuesOfUint64) {
        returnValuesOfUint64 = new uint64[](iAmounts.length/8);
        for(uint i=0;i<iAmounts.length/8;){
            returnValuesOfUint64[i] = tt(iAmounts[32*(i/4):32+32*(i/4)])[i%4];
            unchecked {++i;}
        }   
    } 

    function tt(bytes calldata num) public pure returns (uint64[4] memory returnValues) {
        returnValues[0] = uint64(bytes8(num));
        returnValues[1] = uint64(bytes8(num[8:]));
        returnValues[2] = uint64(bytes8(num[16:]));
        returnValues[3] = uint64(bytes8(num[24:]));
    }
}
