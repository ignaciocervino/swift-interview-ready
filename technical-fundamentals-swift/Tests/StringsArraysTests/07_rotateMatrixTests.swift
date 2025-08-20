import XCTest
@testable import TechnicalFundamentalsSwift

final class RotateMatrixTests: XCTestCase {
    
    func testRotates2x2MatrixClockwise() {
        var matrix = [
            [1, 2],
            [3, 4]
        ]
        let expected = [
            [3, 1],
            [4, 2]
        ]
        rotateMatrix(&matrix)
        XCTAssertEqual(matrix, expected)
    }
    
    func testRotates3x3MatrixClockwise() {
        var matrix = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        let expected = [
            [7, 4, 1],
            [8, 5, 2],
            [9, 6, 3]
        ]
        rotateMatrix(&matrix)
        XCTAssertEqual(matrix, expected)
    }
    
    func testRotates4x4MatrixClockwise() {
        var matrix = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12],
            [13, 14, 15, 16]
        ]
        let expected = [
            [13, 9, 5, 1],
            [14, 10, 6, 2],
            [15, 11, 7, 3],
            [16, 12, 8, 4]
        ]
        rotateMatrix(&matrix)
        XCTAssertEqual(matrix, expected)
    }
    
    func testRotates5x5MatrixClockwise() {
        var matrix = [
            [1, 2, 3, 4, 5],
            [6, 7, 8, 9, 10],
            [11, 12, 13, 14, 15],
            [16, 17, 18, 19, 20],
            [21, 22, 23, 24, 25]
        ]
        let expected = [
            [21, 16, 11, 6, 1],
            [22, 17, 12, 7, 2],
            [23, 18, 13, 8, 3],
            [24, 19, 14, 9, 4],
            [25, 20, 15, 10, 5]
        ]
        rotateMatrix(&matrix)
        XCTAssertEqual(matrix, expected)
    }
}