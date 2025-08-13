import XCTest
@testable import TechnicalFundamentalsSwift

class OneAwayTests: XCTestCase {
    
    func testReturnsTrue_forOneEditAway() {
        XCTAssertTrue(isOneAway("pale", "ple"))
        XCTAssertTrue(isOneAway("pales", "pale"))
        XCTAssertTrue(isOneAway("pale", "bale"))
        XCTAssertTrue(isOneAway("cat", "bat"))
        XCTAssertTrue(isOneAway("", "a"))
        XCTAssertTrue(isOneAway("a", ""))
    }
    
    func testReturnsTrue_forZeroEditsAway() {
        XCTAssertTrue(isOneAway("pale", "pale"))
        XCTAssertTrue(isOneAway("", ""))
        XCTAssertTrue(isOneAway("test", "test"))
    }
    
    func testReturnsFalse_forMoreThanOneEditAway() {
        XCTAssertFalse(isOneAway("pale", "bake"))
        XCTAssertFalse(isOneAway("hello", "world"))
        XCTAssertFalse(isOneAway("abc", "def"))
        XCTAssertFalse(isOneAway("test", "best"))
    }
    
    func testHandlesDifferentLengths_correctly() {
        XCTAssertFalse(isOneAway("abc", "abcde"))
        XCTAssertFalse(isOneAway("hello", "he"))
        XCTAssertTrue(isOneAway("abc", "ab"))
        XCTAssertTrue(isOneAway("ab", "abc"))
    }
    
    func testHandlesCaseSensitive_correctly() {
        XCTAssertTrue(isOneAway("Test", "test"))
        XCTAssertTrue(isOneAway("ABC", "aBC"))
    }
}