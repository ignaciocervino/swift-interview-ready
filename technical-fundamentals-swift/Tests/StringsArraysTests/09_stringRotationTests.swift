import XCTest
@testable import TechnicalFundamentalsSwift

class StringRotationTests: XCTestCase {
    
    func testRotatesString() {
        let str1 = "Hello"
        let str2 = "oHell"
        let result = stringRotation(str1, str2)
        XCTAssertTrue(result)
    }
    
    func testRotatesAnotherString() {
        let str1 = "waterbottle"
        let str2 = "erbottlewat"
        let result = stringRotation(str1, str2)
        XCTAssertTrue(result)
    }
}