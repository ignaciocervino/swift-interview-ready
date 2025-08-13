#!/bin/bash

# Swift Technical Fundamentals Test Runner
# Similar to the TypeScript version with vitest

echo "🚀 Running Swift Technical Fundamentals Tests"
echo "=============================================="

# Change to the Swift package directory
cd "$(dirname "$0")"

# Run all tests
echo "Running all tests..."
swift test

# Check if tests passed
if [ $? -eq 0 ]; then
    echo "✅ All tests passed!"
else
    echo "❌ Some tests failed!"
    exit 1
fi