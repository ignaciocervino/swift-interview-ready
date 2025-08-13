#!/usr/bin/env swift

import Foundation

struct TestResult {
    let testName: String
    let passed: Bool
    let failureMessage: String?
}

struct TestSuite {
    let name: String
    let results: [TestResult]
    
    var allPassed: Bool {
        return results.allSatisfy { $0.passed }
    }
    
    var passedCount: Int {
        return results.filter { $0.passed }.count
    }
    
    var totalCount: Int {
        return results.count
    }
}

class SwiftTestReporter {
    private let greenCheck = "✅"
    private let redCross = "❌"
    private let greenColor = "\u{001B}[32m"
    private let redColor = "\u{001B}[31m"
    private let boldColor = "\u{001B}[1m"
    private let resetColor = "\u{001B}[0m"
    
    func reportTestSuite(_ suite: TestSuite) {
        print("\n\(boldColor)Running \(suite.name)\(resetColor)")
        print("=" * 50)
        
        for result in suite.results {
            let icon = result.passed ? greenCheck : redCross
            let color = result.passed ? greenColor : redColor
            let status = result.passed ? "PASS" : "FAIL"
            
            print("\(color)\(icon) \(result.testName) [\(status)]\(resetColor)")
            
            if let failureMessage = result.failureMessage {
                print("  \(redColor)↳ \(failureMessage)\(resetColor)")
            }
        }
        
        print("\n\(boldColor)Results: \(suite.passedCount)/\(suite.totalCount) tests passed\(resetColor)")
        
        if suite.allPassed {
            print("\(greenColor)\(boldColor)🎉 All tests passed! Great job! ✨\(resetColor)")
            let password = generatePassword(from: suite.results.map { $0.testName })
            print("\(greenColor)\(boldColor)✨ Use this password for your Interview Ready Submission: \(password)\(resetColor)")
        } else {
            print("\(redColor)\(boldColor)❌ Some tests failed. To pass on Interview Ready, you need the password after all tests passed!\(resetColor)")
        }
    }
    
    private func generatePassword(from testNames: [String]) -> String {
        let combined = testNames.joined()
        return String(combined.hashValue).replacingOccurrences(of: "-", with: "")
    }
}

extension String {
    static func *(lhs: String, rhs: Int) -> String {
        return String(repeating: lhs, count: rhs)
    }
}

// Mock test results for demonstration - in real implementation, these would come from XCTest
func runMockTests() {
    let reporter = SwiftTestReporter()
    
    let isUniqueResults = [
        TestResult(testName: "testReturnsTrue_forUniqueCharacters", passed: true, failureMessage: nil),
        TestResult(testName: "testReturnsFalse_forNonUniqueCharacters", passed: true, failureMessage: nil),
        TestResult(testName: "testReturnsTrue_forEmptyString", passed: true, failureMessage: nil),
        TestResult(testName: "testHandlesWhitespace_correctly", passed: true, failureMessage: nil),
        TestResult(testName: "testHandlesSpecialCharacters_correctly", passed: true, failureMessage: nil),
        TestResult(testName: "testHandlesMixedCase_correctly", passed: true, failureMessage: nil)
    ]
    
    let suite = TestSuite(name: "IsUniqueTests", results: isUniqueResults)
    reporter.reportTestSuite(suite)
}

runMockTests()