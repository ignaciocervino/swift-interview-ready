#!/usr/bin/env bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Emojis
CHECK="✅"
CROSS="❌"
INFO="ℹ️"
ROCKET="🚀"

# Check if test name is provided
if [ $# -eq 0 ]; then
    echo -e "${RED}${BOLD}Error: Please provide a test name${NC}"
    echo -e "${YELLOW}Usage: $0 <test_name>${NC}"
    echo -e "${YELLOW}Available tests:${NC}"
    echo "  - isUnique"
    echo "  - checkPermutations"
    echo "  - urlify"
    echo "  - palindromePermutation"
    echo "  - oneAway"
    echo "  - stringCompression"
<<<<<<< HEAD
=======
    echo "  - rotateMatrix"
    echo "  - zeroMatrix"
>>>>>>> main
    echo "  - stringRotation"
    echo -e "\n${YELLOW}Example: $0 isUnique${NC}"
    exit 1
fi

# Map short names to full test class names using case statement
test_name=$1
case "$test_name" in
    "isUnique")
        full_test_name="IsUniqueTests"
        ;;
    "checkPermutations")
        full_test_name="CheckPermutationsTests"
        ;;
    "urlify")
        full_test_name="URLifyTests"
        ;;
    "palindromePermutation")
        full_test_name="PalindromePermutationTests"
        ;;
    "oneAway")
        full_test_name="OneAwayTests"
        ;;
    "stringCompression")
        full_test_name="StringCompressionTests"
        ;;
<<<<<<< HEAD
=======
    "rotateMatrix")
        full_test_name="RotateMatrixTests"
        ;;
    "zeroMatrix")
        full_test_name="ZeroMatrixTests"
        ;;
>>>>>>> main
    "stringRotation")
        full_test_name="StringRotationTests"
        ;;
    *)
        full_test_name="$test_name"
        ;;
esac


echo -e "${BLUE}${BOLD}${ROCKET} Running Individual Test: ${test_name}${NC}"
echo "=============================================="

# Change to the Swift project directory
cd "$(dirname "$0")/.."

echo -e "${INFO} Test Class: ${full_test_name}"
echo -e "${INFO} Running test...\n"

# Run the specific test with verbose output
swift test --filter "$full_test_name" --verbose

exit_code=$?

echo -e "\n=============================================="

if [ $exit_code -eq 0 ]; then
    echo -e "${GREEN}${BOLD}${CHECK} Test ${test_name} PASSED!${NC}"
    
    # Generate hash for individual test
    password=$(echo -n "$test_name" | md5)
    echo -e "${GREEN}Individual test password: ${password}${NC}"
else
    echo -e "${RED}${BOLD}${CROSS} Test ${test_name} FAILED!${NC}"
    echo -e "${RED}Please check the error messages above and fix your implementation.${NC}"
fi

echo -e "\n${BLUE}${BOLD}Quick Commands:${NC}"
<<<<<<< HEAD
echo "Run all string tests: ./Scripts/run-strings.sh"
echo "Run specific test: ./Scripts/run-individual-test.sh <test_name>"
=======
echo "Run all tests: swift test"
echo "Run specific test: ./swift-test.sh <test_name>"
>>>>>>> main
