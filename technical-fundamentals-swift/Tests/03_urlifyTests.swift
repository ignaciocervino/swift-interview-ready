import XCTest
@testable import TechnicalFundamentalsSwift

class URLifyTests: XCTestCase {
    
    func testReplacesSpacesInStringWithPercent20() {
        XCTAssertEqual(URLify("ab c"), "ab%20c")
    }
    
    func testHandlesLeadingAndTrailingSpaces() {
        XCTAssertEqual(URLify("  ab c  "), "%20%20ab%20c%20%20")
    }
    
    func testReturnsEmptyStringWhenInputIsEmpty() {
        XCTAssertEqual(URLify(""), "")
    }
    
    func testDoesntModifyStringWithoutSpaces() {
        XCTAssertEqual(URLify("abc"), "abc")
    }
    
    func testHandlesMultipleConsecutiveSpaces() {
        XCTAssertEqual(URLify("a  b   c"), "a%20%20b%20%20%20c")
    }
    
    func testHandlesSpecialCharacters() {
        XCTAssertEqual(URLify("a b!c"), "a%20b!c")
    }
    
    func testMr3ohnSmith() {
        XCTAssertEqual(URLify("Mr 3ohn Smith"), "Mr%203ohn%20Smith")
    }
}