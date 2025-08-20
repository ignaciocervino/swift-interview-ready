import XCTest
@testable import TechnicalFundamentalsSwift

class IsUniqueTests: XCTestCase {
    
    func testReturnsTrue_forUniqueCharacters() {
        XCTAssertTrue(isUnique("abc"))
        XCTAssertTrue(isUnique("abcdefg"))
        XCTAssertTrue(isUnique("123456"))
        XCTAssertTrue(isUnique("!@#$%^"))
    }
    
    func testReturnsFalse_forNonUniqueCharacters() {
        XCTAssertFalse(isUnique("aab"))
        XCTAssertFalse(isUnique("hello"))
        XCTAssertFalse(isUnique("testing"))
        XCTAssertFalse(isUnique("1234456"))
        XCTAssertFalse(isUnique("abccdef"))
    }
    
    func testReturnsTrue_forEmptyString() {
        XCTAssertTrue(isUnique(""))
    }
    
    func testHandlesWhitespace_correctly() {
        XCTAssertFalse(isUnique("a b c"))
        XCTAssertTrue(isUnique("ab c"))
    }
    
    func testHandlesSpecialCharacters_correctly() {
        XCTAssertTrue(isUnique("!@#$%^&*"))
        XCTAssertFalse(isUnique("!@#$%^&*!"))
    }
    
    func testHandlesMixedCase_correctly() {
        XCTAssertTrue(isUnique("aA"))
        XCTAssertTrue(isUnique("Aa"))
        XCTAssertFalse(isUnique("Hello"))
    }
}