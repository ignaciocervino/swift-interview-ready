import XCTest
@testable import TechnicalFundamentalsSwift

final class KthToLastTests: XCTestCase {
    
    func testReturnsNilIfKLessThanOne() {
        let head = createGenericList([1, 2, 3, 4, 5])
        let result = kthToLast(head, 0)
        XCTAssertNil(result, "Should return nil if k < 1")
        
        let negativeResult = kthToLast(head, -1)
        XCTAssertNil(negativeResult, "Should return nil if k is negative")
    }
    
    func testReturnsNilIfKGreaterThanListLength() {
        let head = createGenericList([1, 2, 3])
        let result = kthToLast(head, 5)
        XCTAssertNil(result, "Should return nil if k > list length")
    }
    
    func testReturnsCorrectKthToLastElement() {
        let head = createGenericList([1, 2, 3, 4, 5])
        
        let result1 = kthToLast(head, 1)
        XCTAssertEqual(result1?.value, 5, "1st to last should be 5")
        
        let result2 = kthToLast(head, 2)
        XCTAssertEqual(result2?.value, 4, "2nd to last should be 4")
        
        let result3 = kthToLast(head, 3)
        XCTAssertEqual(result3?.value, 3, "3rd to last should be 3")
    }
    
    func testReturnsHeadIfKEqualsListLength() {
        let head = createGenericList([1, 2, 3, 4])
        let result = kthToLast(head, 4)
        XCTAssertEqual(result?.value, 1, "Should return head if k equals list length")
    }
    
    func testHandlesSingleNodeList() {
        let head = createGenericList([42])
        let result = kthToLast(head, 1)
        XCTAssertEqual(result?.value, 42, "Should handle single node list")
        
        let invalidResult = kthToLast(head, 2)
        XCTAssertNil(invalidResult, "Should return nil if k > 1 for single node")
    }
    
    func testHandlesEmptyList() {
        let result = kthToLast(nil as Node<Int>?, 1)
        XCTAssertNil(result, "Should return nil for empty list")
    }
}