import XCTest
@testable import TechnicalFundamentalsSwift

class StringRotationTests: XCTestCase {
    
    func testReturnsTrue_forStringRotations() {
        XCTAssertTrue(stringRotation("waterbottle", "erbottlewat"))
        XCTAssertTrue(stringRotation("abcdef", "defabc"))
        XCTAssertTrue(stringRotation("hello", "lohel"))
        XCTAssertTrue(stringRotation("abc", "bca"))
        XCTAssertTrue(stringRotation("abc", "cab"))
    }
    
    func testReturnsTrue_forIdenticalStrings() {
        XCTAssertTrue(stringRotation("hello", "hello"))
        XCTAssertTrue(stringRotation("test", "test"))
        XCTAssertTrue(stringRotation("", ""))
    }
    
    func testReturnsFalse_forNonRotations() {
        XCTAssertFalse(stringRotation("waterbottle", "bottlewater"))
        XCTAssertFalse(stringRotation("abc", "def"))
        XCTAssertFalse(stringRotation("hello", "world"))
        XCTAssertFalse(stringRotation("test", "best"))
    }
    
    func testReturnsFalse_forDifferentLengths() {
        XCTAssertFalse(stringRotation("abc", "abcd"))
        XCTAssertFalse(stringRotation("hello", "hell"))
        XCTAssertFalse(stringRotation("", "a"))
        XCTAssertFalse(stringRotation("a", ""))
    }
    
    func testHandlesSingleCharacter_correctly() {
        XCTAssertTrue(stringRotation("a", "a"))
        XCTAssertFalse(stringRotation("a", "b"))
    }
    
    func testHandlesRepeatedCharacters_correctly() {
        XCTAssertTrue(stringRotation("aaa", "aaa"))
        XCTAssertTrue(stringRotation("abab", "baba"))
        XCTAssertFalse(stringRotation("aaab", "aaba"))
    }
}