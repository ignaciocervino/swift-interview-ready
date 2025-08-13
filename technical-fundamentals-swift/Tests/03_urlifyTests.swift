import XCTest
@testable import TechnicalFundamentalsSwift

class URLifyTests: XCTestCase {
    
    func testReplacesSpaces_withPercent20() {
        XCTAssertEqual(URLify("Mr John Smith"), "Mr%20John%20Smith")
        XCTAssertEqual(URLify("hello world"), "hello%20world")
        XCTAssertEqual(URLify("a b c"), "a%20b%20c")
    }
    
    func testHandlesNoSpaces_correctly() {
        XCTAssertEqual(URLify("hello"), "hello")
        XCTAssertEqual(URLify("test"), "test")
        XCTAssertEqual(URLify(""), "")
    }
    
    func testHandlesMultipleSpaces_correctly() {
        XCTAssertEqual(URLify("hello  world"), "hello%20%20world")
        XCTAssertEqual(URLify("a   b"), "a%20%20%20b")
    }
    
    func testHandlesLeadingAndTrailingSpaces_correctly() {
        XCTAssertEqual(URLify(" hello "), "%20hello%20")
        XCTAssertEqual(URLify("  test  "), "%20%20test%20%20")
    }
    
    func testHandlesOnlySpaces_correctly() {
        XCTAssertEqual(URLify(" "), "%20")
        XCTAssertEqual(URLify("   "), "%20%20%20")
    }
}