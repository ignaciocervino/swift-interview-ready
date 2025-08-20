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
TREE="🌳"
GRAPH="🔗"

echo -e "${BLUE}${BOLD}${TREE}${GRAPH} Swift Trees & Graphs Test Suite${NC}"
echo "=============================================="

# Change to the Swift project directory
cd "$(dirname "$0")/.."

echo -e "${INFO} Running all Trees & Graphs tests...\n"

# Array of Trees & Graphs test problems
trees_graphs_tests=(
    "trees"
    "hasRouteBetweenNodes"
    "minimalTree"
    "listOfDepths"
    "checkBalanced"
    "validateBST"
    "successor"
    "buildOrder"
    "firstCommonAncestor"
    "bstSequences"
)

# Track test results
passed_tests=()
failed_tests=()
test_passwords=()

echo -e "${BLUE}${BOLD}Running Trees & Graphs Tests:${NC}"
echo "=============================================="

# Run each test
for test in "${trees_graphs_tests[@]}"; do
    echo -e "\n${YELLOW}${BOLD}Running: ${test}${NC}"
    echo "----------------------------------------"
    
    # Run the test and capture output
    if ./Scripts/run-individual-test.sh "$test" > /tmp/swift_test_output.log 2>&1; then
        echo -e "${GREEN}${CHECK} $test PASSED${NC}"
        passed_tests+=("$test")
        
        # Extract password from output
        password=$(grep "Individual test password:" /tmp/swift_test_output.log | awk '{print $4}')
        if [ -n "$password" ]; then
            test_passwords+=("$test: $password")
        fi
    else
        echo -e "${RED}${CROSS} $test FAILED${NC}"
        failed_tests+=("$test")
        
        # Show error details
        echo -e "${RED}Error details:${NC}"
        tail -10 /tmp/swift_test_output.log
    fi
done

# Summary
echo -e "\n=============================================="
echo -e "${BLUE}${BOLD}${TREE}${GRAPH} Trees & Graphs Test Summary${NC}"
echo "=============================================="

echo -e "${GREEN}${BOLD}✅ Passed Tests (${#passed_tests[@]}):${NC}"
for test in "${passed_tests[@]}"; do
    echo -e "  ${GREEN}• $test${NC}"
done

if [ ${#failed_tests[@]} -gt 0 ]; then
    echo -e "\n${RED}${BOLD}❌ Failed Tests (${#failed_tests[@]}):${NC}"
    for test in "${failed_tests[@]}"; do
        echo -e "  ${RED}• $test${NC}"
    done
fi

# Show passwords for passed tests
if [ ${#test_passwords[@]} -gt 0 ]; then
    echo -e "\n${YELLOW}${BOLD}🔐 Test Passwords:${NC}"
    for password_info in "${test_passwords[@]}"; do
        echo -e "  ${YELLOW}$password_info${NC}"
    done
fi

# Overall result
total_tests=${#trees_graphs_tests[@]}
passed_count=${#passed_tests[@]}

echo -e "\n${BOLD}Overall: $passed_count/$total_tests tests passed${NC}"

if [ $passed_count -eq $total_tests ]; then
    echo -e "${GREEN}${BOLD}🎉 All Trees & Graphs tests passed!${NC}"
    
    # Generate overall hash for Trees & Graphs
    combined_names=""
    for test in "${trees_graphs_tests[@]}"; do
        combined_names="${combined_names}${test}"
    done
    overall_hash=$(echo -n "$combined_names" | md5)
    echo -e "${GREEN}${BOLD}Trees & Graphs Suite Password: $overall_hash${NC}"
    
    exit 0
else
    echo -e "${RED}${BOLD}Some tests failed. Please fix the issues and try again.${NC}"
    exit 1
fi

# Cleanup
rm -f /tmp/swift_test_output.log