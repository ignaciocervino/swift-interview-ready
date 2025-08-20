import XCTest
@testable import TechnicalFundamentalsSwift

final class SumListsForwardOrderTests: XCTestCase {
    
    func testSumWithoutCarryover() {
        // (1->2->3) + (4->5->6) = 123 + 456 = 579 -> (5->7->9)
        let list1 = createGenericList([1, 2, 3])
        let list2 = createGenericList([4, 5, 6])
        let result = sumListsForwardOrder(list1, list2)
        let expected = [5, 7, 9]
        XCTAssertEqual(genericListToArray(result), expected, "Should sum 123 + 456 = 579")
    }
    
    func testSumWithCarryover() {
        // (9->9->9) + (1) = 999 + 1 = 1000 -> (1->0->0->0)
        let list1 = createGenericList([9, 9, 9])
        let list2 = createGenericList([1])
        let result = sumListsForwardOrder(list1, list2)
        let expected = [1, 0, 0, 0]
        XCTAssertEqual(genericListToArray(result), expected, "Should handle carryover: 999 + 1 = 1000")
    }
    
    func testSumListsOfDifferentLengths() {
        // (1->2->3->4) + (5->6) = 1234 + 56 = 1290 -> (1->2->9->0)
        let list1 = createGenericList([1, 2, 3, 4])
        let list2 = createGenericList([5, 6])
        let result = sumListsForwardOrder(list1, list2)
        let expected = [1, 2, 9, 0]
        XCTAssertEqual(genericListToArray(result), expected, "Should handle different length lists: 1234 + 56 = 1290")
    }
    
    func testHandleEmptyLists() {
        let list1 = createGenericList([1, 2, 3])
        let result1 = sumListsForwardOrder(list1, nil)
        let expected1 = [1, 2, 3]
        XCTAssertEqual(genericListToArray(result1), expected1, "Should handle one empty list")
        
        let list2 = createGenericList([4, 5, 6])
        let result2 = sumListsForwardOrder(nil, list2)
        let expected2 = [4, 5, 6]
        XCTAssertEqual(genericListToArray(result2), expected2, "Should handle one empty list")
        
        let result3 = sumListsForwardOrder(nil, nil)
        XCTAssertNil(result3, "Should handle both empty lists")
    }
    
    func testHandleOneEmptyOneNonEmpty() {
        let nonEmpty = createGenericList([1, 2, 3])
        
        let result1 = sumListsForwardOrder(nonEmpty, nil)
        XCTAssertEqual(genericListToArray(result1), [1, 2, 3], "Should return non-empty list when other is empty")
        
        let result2 = sumListsForwardOrder(nil, nonEmpty)
        XCTAssertEqual(genericListToArray(result2), [1, 2, 3], "Should return non-empty list when other is empty")
    }
    
    func testOriginalExample() {
        // (6->1->7) + (2->9->5) = 617 + 295 = 912 -> (9->1->2)
        let list1 = createGenericList([6, 1, 7])
        let list2 = createGenericList([2, 9, 5])
        let result = sumListsForwardOrder(list1, list2)
        let expected = [9, 1, 2]
        XCTAssertEqual(genericListToArray(result), expected, "Should match original example: 617 + 295 = 912")
    }
    
    func testSumSingleDigits() {
        // (7) + (5) = 7 + 5 = 12 -> (1->2)
        let list1 = createGenericList([7])
        let list2 = createGenericList([5])
        let result = sumListsForwardOrder(list1, list2)
        let expected = [1, 2]
        XCTAssertEqual(genericListToArray(result), expected, "Should sum single digits with carry: 7 + 5 = 12")
    }
}