import XCTest
@testable import TechnicalFundamentalsSwift

final class MinimalTreeTests: XCTestCase {
    
    func testCreatesMinimalHeightBSTFromSortedArray3Elements() {
        let sortedArray = [1, 2, 3]
        let result = minimalTree(sortedArray)
        
        // Expected tree structure:
        //     2
        //    / \
        //   1   3
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.value, 2)
        XCTAssertEqual(result?.left?.value, 1)
        XCTAssertEqual(result?.right?.value, 3)
        XCTAssertNil(result?.left?.left)
        XCTAssertNil(result?.left?.right)
        XCTAssertNil(result?.right?.left)
        XCTAssertNil(result?.right?.right)
    }
    
    func testCreatesMinimalHeightBSTFromSortedArray5Elements() {
        let sortedArray = [1, 2, 3, 4, 5]
        let result = minimalTree(sortedArray)
        
        // Expected tree structure:
        //     3
        //    / \
        //   2   5
        //  /   /
        // 1   4
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.value, 3)
        XCTAssertEqual(result?.left?.value, 2)
        XCTAssertEqual(result?.right?.value, 5)
        XCTAssertEqual(result?.left?.left?.value, 1)
        XCTAssertNil(result?.left?.right)
        XCTAssertEqual(result?.right?.left?.value, 4)
        XCTAssertNil(result?.right?.right)
    }
    
    func testCreatesMinimalHeightBSTFromSortedArray7Elements() {
        let sortedArray = [1, 2, 3, 4, 5, 6, 7]
        let result = minimalTree(sortedArray)
        
        // Expected tree structure:
        //       4
        //      / \
        //     2   6
        //    / \ / \
        //   1  3 5  7
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.value, 4)
        XCTAssertEqual(result?.left?.value, 2)
        XCTAssertEqual(result?.right?.value, 6)
        XCTAssertEqual(result?.left?.left?.value, 1)
        XCTAssertEqual(result?.left?.right?.value, 3)
        XCTAssertEqual(result?.right?.left?.value, 5)
        XCTAssertEqual(result?.right?.right?.value, 7)
    }
    
    func testReturnsNilForEmptyArray() {
        let sortedArray: [Int] = []
        let result = minimalTree(sortedArray)
        
        XCTAssertNil(result)
    }
    
    func testSingleElementArray() {
        let sortedArray = [42]
        let result = minimalTree(sortedArray)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.value, 42)
        XCTAssertNil(result?.left)
        XCTAssertNil(result?.right)
    }
    
    func testTwoElementArray() {
        let sortedArray = [1, 2]
        let result = minimalTree(sortedArray)
        
        // Expected tree structure:
        //   2
        //  /
        // 1
        // OR
        //   1
        //    \
        //     2
        // Either is valid for minimal height
        XCTAssertNotNil(result)
        XCTAssertTrue((result?.value == 1 && result?.right?.value == 2) ||
                      (result?.value == 2 && result?.left?.value == 1))
    }
}