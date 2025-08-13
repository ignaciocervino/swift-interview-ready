import XCTest
@testable import TechnicalFundamentalsSwift

class StringCompressionTests: XCTestCase {
    
    func testCompressesStringWithRepeatedCharacters() {
        XCTAssertEqual(stringCompression("aabcccccaaa"), "a2b1c5a3")
    }
    
    func testReturnsOriginalStringIfCompressionDoesNotReduceLength() {
        XCTAssertEqual(stringCompression("abcde"), "abcde")
    }
    
    func testReturnsEmptyStringForEmptyInput() {
        XCTAssertEqual(stringCompression(""), "")
    }
    
    func testReturnsSingleCharacterForStringWithSingleCharacter() {
        XCTAssertEqual(stringCompression("a"), "a")
    }
    
    func testCompressesStringWithUppercaseAndLowercaseLetters() {
        XCTAssertEqual(stringCompression("AAAbbbCCCddd"), "A3b3C3d3")
    }
    
    func testReturnsOriginalStringIfNoRepeatedCharacters() {
        XCTAssertEqual(stringCompression("abcdef"), "abcdef")
    }
}