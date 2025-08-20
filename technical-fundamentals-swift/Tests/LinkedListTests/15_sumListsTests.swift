import XCTest
@testable import TechnicalFundamentalsSwift

final class SumListsTests: XCTestCase {
    
    func testSumWithoutCarryover() {
        // (2->4->3) + (5->6->4) = 342 + 465 = 807 -> (7->0->8)
        let list1 = createGenericList([2, 4, 3])
        let list2 = createGenericList([5, 6, 4])
        let result = sumLists(list1, list2)
        let expected = [7, 0, 8]
        XCTAssertEqual(genericListToArray(result), expected, "Should sum 342 + 465 = 807")
    }
    
    func testSumWithCarryover() {
        // (9->9->9) + (1) = 999 + 1 = 1000 -> (0->0->0->1)
        let list1 = createGenericList([9, 9, 9])
        let list2 = createGenericList([1])
        let result = sumLists(list1, list2)
        let expected = [0, 0, 0, 1]
        XCTAssertEqual(genericListToArray(result), expected, "Should handle carryover: 999 + 1 = 1000")
    }
    
    func testSumListsOfDifferentLengths() {
        // (9->9) + (1->2->3) = 99 + 321 = 420 -> (0->2->4)
        let list1 = createGenericList([9, 9])
        let list2 = createGenericList([1, 2, 3])
        let result = sumLists(list1, list2)
        let expected = [0, 2, 4]
        XCTAssertEqual(genericListToArray(result), expected, "Should handle different length lists: 99 + 321 = 420")
    }
    
    func testSumWithEmptyLists() {
        let list1 = createGenericList([1, 2, 3])
        let result1 = sumLists(list1, nil)
        let expected1 = [1, 2, 3]
        XCTAssertEqual(genericListToArray(result1), expected1, "Should handle one empty list")
        
        let list2 = createGenericList([4, 5, 6])
        let result2 = sumLists(nil, list2)
        let expected2 = [4, 5, 6]
        XCTAssertEqual(genericListToArray(result2), expected2, "Should handle one empty list")
        
        let result3 = sumLists(nil, nil)
        XCTAssertNil(result3, "Should handle both empty lists")
    }
    
    func testSumSingleDigits() {
        // (7) + (5) = 7 + 5 = 12 -> (2->1)
        let list1 = createGenericList([7])
        let list2 = createGenericList([5])
        let result = sumLists(list1, list2)
        let expected = [2, 1]
        XCTAssertEqual(genericListToArray(result), expected, "Should sum single digits with carry: 7 + 5 = 12")
    }
    
    func testOriginalExample() {
        // (7->1->6) + (5->9->2) = 617 + 295 = 912 -> (2->1->9)
        let list1 = createGenericList([7, 1, 6])
        let list2 = createGenericList([5, 9, 2])
        let result = sumLists(list1, list2)
        let expected = [2, 1, 9]
        XCTAssertEqual(genericListToArray(result), expected, "Should match original example: 617 + 295 = 912")
    }
}