import XCTest
@testable import TechnicalFundamentalsSwift

class OneAwayTests: XCTestCase {
    
    func testOneAway_Replace() {
        XCTAssertTrue(isOneAway("pale", "bale")) // Replacement
        XCTAssertFalse(isOneAway("bbaa", "bcca")) // Replacement
    }
    
    func testOneAway_Replace2() {
        XCTAssertTrue(isOneAway("pale", "bale")) // Replacement
    }
    
    func testOneAway_Insert() {
        XCTAssertTrue(isOneAway("pale", "ple")) // Insertion
    }
    
    func testOneAway_Remove() {
        XCTAssertTrue(isOneAway("pale", "pales")) // Removal
    }
    
    func testSameStrings() {
        XCTAssertTrue(isOneAway("abc", "abc")) // No edits
    }
    
    func testMoreThanOneEditAway() {
        XCTAssertFalse(isOneAway("abcd", "efgh")) // More than one edit away
    }
    
    func testMoreThanOneEditAway2() {
        XCTAssertFalse(isOneAway("palesa", "pale")) // More than one edit away #2
    }
    
    func testEmptyStrings() {
        XCTAssertTrue(isOneAway("", "")) // Empty strings are zero edits away
    }
    
    func testOneCharacterDifference() {
        XCTAssertTrue(isOneAway("a", "ab")) // One character difference
    }
    
    func testEmptyAndNonEmptyString() {
        XCTAssertTrue(isOneAway("", "a")) // Empty string and a non-empty string
    }
}