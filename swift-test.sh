#!/bin/bash
# Swift Individual Test - Run from root directory
# Usage: ./swift-test.sh <problem_name>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <problem_name>"
    echo "Available problems: isUnique, checkPermutations, urlify, palindromePermutation, oneAway, stringCompression, rotateMatrix, zeroMatrix, stringRotation"
    exit 1
fi

cd "$(dirname "$0")/technical-fundamentals-swift"
./Scripts/run-individual-test.sh "$1"