import XCTest
@testable import TechnicalFundamentalsSwift

final class DeleteMiddleNodeTests: XCTestCase {
    
    func testDeletesMiddleNodeAtSpecifiedPosition() {
        let head = createGenericList(["a", "b", "c", "d", "e", "f"])
        let result = deleteMiddleNode(head, 3) // delete 'c' at position 3
        let expected = ["a", "b", "d", "e", "f"]
        XCTAssertEqual(genericListToArray(result), expected, "Should delete node at position 3")
    }
    
    func testDeletesAnotherMiddleNode() {
        let head = createGenericList([1, 2, 3, 4, 5])
        let result = deleteMiddleNode(head, 2) // delete node with value 2
        let expected = [1, 3, 4, 5]
        XCTAssertEqual(genericListToArray(result), expected, "Should delete node at position 2")
    }
    
    func testNoDeletionIfPositionOutOfRange() {
        let head = createGenericList([1, 2, 3])
        let result = deleteMiddleNode(head, 5) // position out of range
        let expected = [1, 2, 3]
        XCTAssertEqual(genericListToArray(result), expected, "Should not delete if position out of range")
    }
    
    func testNoDeletionIfPositionLessThanOne() {
        let head = createGenericList([1, 2, 3])
        let result = deleteMiddleNode(head, 0) // invalid position
        let expected = [1, 2, 3]
        XCTAssertEqual(genericListToArray(result), expected, "Should not delete if position < 1")
    }
    
    func testNoDeletionForSingleNodeList() {
        let head = createGenericList([42])
        let result = deleteMiddleNode(head, 1) // can't delete only node
        let expected = [42]
        XCTAssertEqual(genericListToArray(result), expected, "Should not delete single node")
    }
    
    func testNoDeletionForTwoNodeList() {
        let head = createGenericList([1, 2])
        let result1 = deleteMiddleNode(head, 1) // can't delete first
        let expected1 = [1, 2]
        XCTAssertEqual(genericListToArray(result1), expected1, "Should not delete first of two nodes")
        
        let head2 = createGenericList([1, 2])
        let result2 = deleteMiddleNode(head2, 2) // can't delete last
        let expected2 = [1, 2]
        XCTAssertEqual(genericListToArray(result2), expected2, "Should not delete last of two nodes")
    }
    
    func testHandlesEmptyList() {
        let result = deleteMiddleNode(nil as Node<Int>?, 1)
        XCTAssertNil(result, "Should handle empty list")
    }
}