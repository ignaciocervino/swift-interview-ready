import XCTest
@testable import TechnicalFundamentalsSwift

class PalindromePermutationTests: XCTestCase {
    
    func testReturnsTrue_forPalindromePermutations() {
        XCTAssertTrue(palindromePermutation("Tact Coa"))
        XCTAssertTrue(palindromePermutation("aab"))
        XCTAssertTrue(palindromePermutation("carerac"))
        XCTAssertTrue(palindromePermutation("a"))
        XCTAssertTrue(palindromePermutation(""))
    }
    
    func testReturnsFalse_forNonPalindromePermutations() {
        XCTAssertFalse(palindromePermutation("abc"))
        XCTAssertFalse(palindromePermutation("hello"))
        XCTAssertFalse(palindromePermutation("abcd"))
        XCTAssertFalse(palindromePermutation("test"))
    }
    
    func testIgnoresSpaces_correctly() {
        XCTAssertTrue(palindromePermutation("a a b"))
        XCTAssertTrue(palindromePermutation("race car"))
        XCTAssertFalse(palindromePermutation("hello world"))
    }
    
    func testIgnoresCase_correctly() {
        XCTAssertTrue(palindromePermutation("AaB"))
        XCTAssertTrue(palindromePermutation("RaceCar"))
        XCTAssertFalse(palindromePermutation("AbC"))
    }
    
    func testHandlesSpecialCharacters_correctly() {
        XCTAssertTrue(palindromePermutation("!@!"))
        XCTAssertTrue(palindromePermutation("!@@!"))
        XCTAssertFalse(palindromePermutation("!@#"))
    }
}