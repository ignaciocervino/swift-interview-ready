import XCTest
@testable import TechnicalFundamentalsSwift

class CheckPermutationsTests: XCTestCase {
    
    func testReturnsTrue_forPermutations() {
        XCTAssertTrue(checkPermutations("abc", "bca"))
        XCTAssertTrue(checkPermutations("listen", "silent"))
        XCTAssertTrue(checkPermutations("god", "dog"))
        XCTAssertTrue(checkPermutations("", ""))
    }
    
    func testReturnsFalse_forNonPermutations() {
        XCTAssertFalse(checkPermutations("abc", "def"))
        XCTAssertFalse(checkPermutations("hello", "world"))
        XCTAssertFalse(checkPermutations("abc", "abcd"))
        XCTAssertFalse(checkPermutations("test", "best"))
    }
    
    func testHandlesDifferentLengths_correctly() {
        XCTAssertFalse(checkPermutations("a", "aa"))
        XCTAssertFalse(checkPermutations("abc", "ab"))
        XCTAssertFalse(checkPermutations("", "a"))
    }
    
    func testHandlesCaseSensitive_correctly() {
        XCTAssertFalse(checkPermutations("Abc", "abc"))
        XCTAssertTrue(checkPermutations("ABC", "CAB"))
    }
    
    func testHandlesSpecialCharacters_correctly() {
        XCTAssertTrue(checkPermutations("!@#", "#@!"))
        XCTAssertFalse(checkPermutations("!@#", "!@$"))
    }
}