// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    // Changed to Fixed-Size Array
    uint[10] numbers = [1,2,3,4,5,6,7,8,9,10];
    
    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
    
    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    function optimizedFunction() public {
        // Caching state variable
        uint[10] storage cachedNumbers = numbers;

        // Implement uncheck block and change increment syntax
        unchecked {
            for (uint i = 0; i < cachedNumbers.length; ++i) {
                cachedNumbers[i] = 0;
            }
        }
    }
}
