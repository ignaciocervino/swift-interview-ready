import XCTest
@testable import TechnicalFundamentalsSwift

final class ZeroMatrixTests: XCTestCase {
    
    func testZeroes2x2Matrix() {
        var matrix = [
            [0, 2],
            [3, 4]
        ]
        let expected = [
            [0, 0],
            [0, 4]
        ]
        zeroMatrix(&matrix)
        XCTAssertEqual(matrix, expected)
    }
    
    func testZeroes3x3Matrix() {
        var matrix = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 0, 9]
        ]
        let expected = [
            [1, 0, 3],
            [4, 0, 6],
            [0, 0, 0]
        ]
        zeroMatrix(&matrix)
        XCTAssertEqual(matrix, expected)
    }
    
    func testZeroes4x4Matrix() {
        var matrix = [
            [1, 2, 3, 4],
            [5, 6, 0, 8],
            [9, 10, 11, 12],
            [13, 14, 15, 16]
        ]
        let expected = [
            [1, 2, 0, 4],
            [0, 0, 0, 0],
            [9, 10, 0, 12],
            [13, 14, 0, 16]
        ]
        zeroMatrix(&matrix)
        XCTAssertEqual(matrix, expected)
    }
    
    func test2Zeroes4x4Matrix() {
        var matrix = [
            [0, 2, 3, 4],
            [5, 6, 0, 8],
            [9, 10, 11, 12],
            [13, 14, 15, 16]
        ]
        let expected = [
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 10, 0, 12],
            [0, 14, 0, 16]
        ]
        zeroMatrix(&matrix)
        XCTAssertEqual(matrix, expected)
    }
}