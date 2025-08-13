#!/bin/bash

# Swift Technical Fundamentals Test Runner (from root directory)
echo "🚀 Running Swift Technical Fundamentals Tests"
echo "=============================================="

cd technical-fundamentals-swift
swift test

if [ $? -eq 0 ]; then
    echo "✅ All Swift tests passed!"
else
    echo "❌ Some Swift tests failed!"
    exit 1
fi