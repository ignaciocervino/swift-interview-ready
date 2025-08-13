import XCTest
@testable import TechnicalFundamentalsSwift

class PalindromePermutationTests: XCTestCase {
    
    func testEmptyString() {
        XCTAssertTrue(palindromePermutation(""))
    }
    
    func testSingleCharacterString() {
        XCTAssertTrue(palindromePermutation("a"))
    }
    
    func testPalindromeWithOddLength() {
        XCTAssertTrue(palindromePermutation("taco cat"))
    }
    
    func testPalindromeWithEvenLength() {
        XCTAssertTrue(palindromePermutation("rdeder"))
    }
    
    func testNonPalindromeWithOddLength() {
        XCTAssertFalse(palindromePermutation("hello"))
    }
    
    func testNonPalindromeWithEvenLength() {
        XCTAssertFalse(palindromePermutation("world"))
    }
    
    func testStringWithMixedCase() {
        XCTAssertTrue(palindromePermutation("RaceCar"))
    }
    
    func testStringWithNonAlphanumericCharacters() {
        XCTAssertTrue(palindromePermutation("12321"))
    }
    
    func testStringWithNoPossiblePalindromePermutation() {
        XCTAssertFalse(palindromePermutation("abcdefg"))
    }
}