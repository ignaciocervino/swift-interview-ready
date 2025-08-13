#!/bin/bash

# Colors and formatting
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m' # No Color

# Unicode symbols
CHECK="✅"
CROSS="❌"
PENDING="⏳"
STAR="⭐"
ROCKET="🚀"
CELEBRATION="🎉"

clear

echo -e "${BLUE}${BOLD}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                 SWIFT INTERVIEW READY DASHBOARD               ║"
echo "║                    String Problems Test Suite                 ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Change to project directory
cd "$(dirname "$0")/.."

# Test definitions
declare -a test_problems=(
    "IsUnique:Is Unique"
    "CheckPermutations:Check Permutations" 
    "URLify:URLify"
    "PalindromePermutation:Palindrome Permutation"
    "OneAway:One Away"
    "StringCompression:String Compression"
    "StringRotation:String Rotation"
)

total_tests=0
passed_tests=0
failed_tests=()
test_results=()

echo -e "${BOLD}Running all string problem tests...${NC}\n"

# Test each problem
for problem in "${test_problems[@]}"; do
    IFS=':' read -ra PARTS <<< "$problem"
    test_class="${PARTS[0]}"
    problem_name="${PARTS[1]}"
    
    echo -e "${DIM}Testing ${problem_name}...${NC}"
    
    # Run test and capture result
    test_output=$(swift test --filter "$test_class" 2>&1)
    exit_code=$?
    
    # Check if test actually ran and passed
    if echo "$test_output" | grep -q "No matching test cases were run"; then
        test_results+=("${problem_name}:NOT_FOUND")
        failed_tests+=("$problem_name")
    elif [ $exit_code -eq 0 ]; then
        test_results+=("${problem_name}:PASS")
        ((passed_tests++))
    else
        test_results+=("${problem_name}:FAIL")
        failed_tests+=("$problem_name")
    fi
    ((total_tests++))
done

clear

# Display results dashboard
echo -e "${BLUE}${BOLD}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                 SWIFT INTERVIEW READY DASHBOARD               ║"
echo "║                    String Problems Results                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "\n${BOLD}Test Results Overview:${NC}"
echo "┌────────────────────────────────────────────────┬────────────┐"
echo "│ Problem                                        │   Status   │"
echo "├────────────────────────────────────────────────┼────────────┤"

for result in "${test_results[@]}"; do
    IFS=':' read -ra PARTS <<< "$result"
    problem_name="${PARTS[0]}"
    status="${PARTS[1]}"
    
    # Pad problem name to 46 characters
    padded_name=$(printf "%-46s" "$problem_name")
    
    if [ "$status" = "PASS" ]; then
        echo -e "│ ${padded_name} │ ${GREEN}${CHECK} PASS${NC}   │"
    elif [ "$status" = "NOT_FOUND" ]; then
        echo -e "│ ${padded_name} │ ${YELLOW}⚠️  N/A${NC}    │"
    else
        echo -e "│ ${padded_name} │ ${RED}${CROSS} FAIL${NC}   │"
    fi
done

echo "└────────────────────────────────────────────────┴────────────┘"

# Summary section
echo -e "\n${BOLD}Summary:${NC}"
echo "┌─────────────────────────────────────────────────────────────┐"
echo -e "│ Total Tests: ${total_tests}                                                  │"
echo -e "│ Passed: ${GREEN}${passed_tests}${NC}                                                     │"
echo -e "│ Failed: ${RED}$((total_tests - passed_tests))${NC}                                                     │"
echo -e "│ Success Rate: $((passed_tests * 100 / total_tests))%                                              │"
echo "└─────────────────────────────────────────────────────────────┘"

# Final status
echo ""
if [ ${#failed_tests[@]} -eq 0 ]; then
    echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║  ${CELEBRATION} CONGRATULATIONS! ALL TESTS PASSED! ${CELEBRATION}              ║${NC}"
    echo -e "${GREEN}${BOLD}║                                                               ║${NC}"
    hash_input=$(echo "${test_problems[@]}" | tr -d ' ')
    password=$(echo -n "$hash_input" | shasum -a 256 | cut -c1-8)
    printf "${GREEN}${BOLD}║  %-55s ║${NC}\n" "Interview Ready Password: $password"
    echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════╝${NC}"
else
    echo -e "${RED}${BOLD}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}║  ${CROSS} SOME TESTS FAILED - KEEP WORKING! ${CROSS}                    ║${NC}"
    echo -e "${RED}${BOLD}║                                                               ║${NC}"
    echo -e "${RED}${BOLD}║  Failed Problems:                                             ║${NC}"
    for failed in "${failed_tests[@]}"; do
        printf "${RED}${BOLD}║  - %-54s ║${NC}\n" "$failed"
    done
    echo -e "${RED}${BOLD}║                                                               ║${NC}"
    echo -e "${RED}${BOLD}║  Fix these tests to get your Interview Ready password!       ║${NC}"
    echo -e "${RED}${BOLD}╚═══════════════════════════════════════════════════════════════╝${NC}"
fi

echo -e "\n${YELLOW}${BOLD}Quick Commands:${NC}"
echo "• Run individual test: ./Scripts/run-individual-test.sh <problem_name>"
echo "• View this dashboard: ./Scripts/test-dashboard.sh"
echo "• Run all strings: ./Scripts/run-strings.sh"

echo -e "\n${DIM}Available problem names: isUnique, checkPermutations, urlify, palindromePermutation, oneAway, stringCompression, stringRotation${NC}"