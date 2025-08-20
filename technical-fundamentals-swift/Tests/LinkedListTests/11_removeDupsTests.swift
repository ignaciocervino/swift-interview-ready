import XCTest
@testable import TechnicalFundamentalsSwift

final class RemoveDupsTests: XCTestCase {
    
    func testRemoveDuplicatesFromListWithDuplicates() {
        let head = createGenericList([1, 2, 2, 2, 4])
        let result = removeDups(head)
        let expected = [1, 2, 4]
        XCTAssertEqual(genericListToArray(result), expected, "Should remove duplicates: 1->2->2->2->4 becomes 1->2->4")
    }
    
    func testHandleListWithNoDuplicates() {
        let head = createGenericList([1, 2, 3, 4])
        let result = removeDups(head)
        let expected = [1, 2, 3, 4]
        XCTAssertEqual(genericListToArray(result), expected, "Should keep all unique elements")
    }
    
    func testHandleMultipleConsecutiveDuplicates() {
        let head = createGenericList([1, 1, 1, 2, 2, 3, 3, 3, 3])
        let result = removeDups(head)
        let expected = [1, 2, 3]
        XCTAssertEqual(genericListToArray(result), expected, "Should handle multiple consecutive duplicates")
    }
    
    func testHandleEmptyList() {
        let result = removeDups(nil as Node<Int>?)
        XCTAssertNil(result, "Should handle empty list")
    }
    
    func testHandleSingleNodeList() {
        let head = createGenericList([1])
        let result = removeDups(head)
        let expected = [1]
        XCTAssertEqual(genericListToArray(result), expected, "Should handle single node list")
    }
    
    func testRemoveDuplicatesWithStrings() {
        let head = createGenericList(["a", "b", "b", "c", "a"])
        let result = removeDups(head)
        let expected = ["a", "b", "c"]
        XCTAssertEqual(genericListToArray(result), expected, "Should work with string values")
    }
}