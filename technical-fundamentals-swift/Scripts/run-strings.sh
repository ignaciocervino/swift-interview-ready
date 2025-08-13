#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Emojis
CHECK="✅"
CROSS="❌"
ROCKET="🚀"
CELEBRATION="🎉"

echo -e "${BLUE}${BOLD}${ROCKET} Running Swift String Problems Tests${NC}"
echo "================================================="

# Change to the Swift project directory
cd "$(dirname "$0")/.."

# Array of string problem test files
string_tests=(
    "IsUniqueTests"
    "CheckPermutationsTests" 
    "URLifyTests"
    "PalindromePermutationTests"
    "OneAwayTests"
    "StringCompressionTests"
    "RotateMatrixTests"
    "ZeroMatrixTests"
    "StringRotationTests"
)

total_tests=0
passed_tests=0
failed_tests=()

echo -e "\n${BOLD}String Problems Test Results:${NC}"
echo "================================="

# Run each test and capture results
for test in "${string_tests[@]}"; do
    echo -e "\n${BOLD}Running ${test}...${NC}"
    
    # Run the specific test
    result=$(swift test --filter ${test} 2>&1)
    exit_code=$?
    
    # Check if test actually ran (avoid "No matching test cases" issue)
    if echo "$result" | grep -q "No matching test cases were run"; then
        echo -e "${RED}${CROSS} ${test} NOT FOUND${NC}"
        echo -e "${RED}Error: Test class not found or no tests executed${NC}"
        failed_tests+=("$test (NOT FOUND)")
    elif [ $exit_code -eq 0 ]; then
        echo -e "${GREEN}${CHECK} ${test} PASSED${NC}"
        ((passed_tests++))
    else
        echo -e "${RED}${CROSS} ${test} FAILED${NC}"
        failed_tests+=("$test")
        # Show failure details
        echo -e "${RED}Error details:${NC}"
        echo "$result" | grep -E "(error|failed|Failed)" | head -3
    fi
    
    ((total_tests++))
done

# Final summary
echo -e "\n${BOLD}===============================================${NC}"
echo -e "${BOLD}Test Summary: ${passed_tests}/${total_tests} passed${NC}"

if [ ${#failed_tests[@]} -eq 0 ]; then
    echo -e "${GREEN}${BOLD}${CELEBRATION} All string tests passed! Great job! ${CELEBRATION}${NC}"
    
    # Generate a simple hash for "password" like the TypeScript version
    hash_input=$(echo "${string_tests[@]}" | tr -d ' ')
    password=$(echo -n "$hash_input" | md5)
    echo -e "${GREEN}${BOLD}✨ Use this password for your Interview Ready Submission: ${password}${NC}"
else
    echo -e "${RED}${BOLD}${CROSS} Failed tests:${NC}"
    for failed in "${failed_tests[@]}"; do
        echo -e "${RED}  - ${failed}${NC}"
    done
    echo -e "${RED}${BOLD}❌ Fix the failing tests to get your Interview Ready password!${NC}"
fi

echo -e "\n${BLUE}${BOLD}To run individual tests:${NC}"
echo "swift test --filter <TestClassName>"
echo "Example: swift test --filter 01_isUniqueTests"