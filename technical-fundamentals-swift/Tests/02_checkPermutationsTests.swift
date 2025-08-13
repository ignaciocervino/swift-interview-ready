import XCTest
@testable import TechnicalFundamentalsSwift

class CheckPermutationsTests: XCTestCase {
    
    func testReturnsTrueForPermutationsWithSameLengthStrings() {
        XCTAssertTrue(checkPermutations("abc", "cba"))
    }
    
    func testReturnsFalseForStringsWithDifferentLengths() {
        XCTAssertFalse(checkPermutations("abc", "cbad"))
    }
    
    func testReturnsTrueForPermutationsWithSpecialCharacters() {
        XCTAssertTrue(checkPermutations("abc!", "!bac"))
    }
    
    func testReturnsFalseForNonPermutationsWithSpecialCharacters() {
        XCTAssertFalse(checkPermutations("abc!", "!bcd"))
    }
    
    func testReturnsTrueForEmptyStrings() {
        XCTAssertTrue(checkPermutations("", ""))
    }
    
    func testReturnsTrueForLongStringsWithSameCharacters() {
        let longStringA = String(repeating: "a", count: 1000)
        let longStringB = String(repeating: "a", count: 1000)
        XCTAssertTrue(checkPermutations(longStringA, longStringB))
    }
    
    func testReturnsFalseForLongStringsWithDifferentCharacters() {
        let longStringA = String(repeating: "a", count: 1000)
        let longStringB = String(repeating: "b", count: 1000)
        XCTAssertFalse(checkPermutations(longStringA, longStringB))
    }
}