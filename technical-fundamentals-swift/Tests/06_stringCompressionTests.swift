import XCTest
@testable import TechnicalFundamentalsSwift

class StringCompressionTests: XCTestCase {
    
    func testCompressesString_whenShorter() {
        XCTAssertEqual(stringCompression("aabcccccaaa"), "a2b1c5a3")
        XCTAssertEqual(stringCompression("aabbcc"), "a2b2c2")
        XCTAssertEqual(stringCompression("aaaa"), "a4")
        XCTAssertEqual(stringCompression("abbbbbbbbbbbbbbb"), "a1b15")
    }
    
    func testReturnsOriginal_whenCompressionNotShorter() {
        XCTAssertEqual(stringCompression("abc"), "abc")
        XCTAssertEqual(stringCompression("abcd"), "abcd")
        XCTAssertEqual(stringCompression("abcdef"), "abcdef")
        XCTAssertEqual(stringCompression("aabb"), "aabb")
    }
    
    func testHandlesEmptyString_correctly() {
        XCTAssertEqual(stringCompression(""), "")
    }
    
    func testHandlesSingleCharacter_correctly() {
        XCTAssertEqual(stringCompression("a"), "a")
        XCTAssertEqual(stringCompression("Z"), "Z")
    }
    
    func testHandlesMixedCase_correctly() {
        XCTAssertEqual(stringCompression("AAAaaa"), "A3a3")
        XCTAssertEqual(stringCompression("AaAaAa"), "AaAaAa")
    }
    
    func testHandlesLongSequences_correctly() {
        let longString = String(repeating: "a", count: 100)
        XCTAssertEqual(stringCompression(longString), "a100")
    }
}