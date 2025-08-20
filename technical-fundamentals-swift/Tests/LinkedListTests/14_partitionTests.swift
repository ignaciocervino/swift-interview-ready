import XCTest
@testable import TechnicalFundamentalsSwift

final class PartitionTests: XCTestCase {
    
    func testPartitionsListCorrectlyAroundPivot() {
        let head = createGenericList([3, 5, 8, 5, 10, 2, 1])
        let result = partition(head, 5)
        let resultArray = genericListToArray(result)
        
        // Find the first occurrence of 5 in the result
        guard let pivotIndex = resultArray.firstIndex(of: 5) else {
            XCTFail("Pivot value should be present in result")
            return
        }
        
        // All values before first 5 should be < 5
        for i in 0..<pivotIndex {
            XCTAssertLessThan(resultArray[i], 5, "Values before pivot should be < 5")
        }
        
        // All values from first 5 onwards should be >= 5
        for i in pivotIndex..<resultArray.count {
            XCTAssertGreaterThanOrEqual(resultArray[i], 5, "Values from pivot onwards should be >= 5")
        }
        
        // Should contain all original values
        XCTAssertEqual(resultArray.sorted(), [1, 2, 3, 5, 5, 8, 10], "Should contain all original values")
    }
    
    func testHandlesSingleNodeList() {
        let head = createGenericList([5])
        let result = partition(head, 3)
        let expected = [5]
        XCTAssertEqual(genericListToArray(result), expected, "Should handle single node list")
        
        let head2 = createGenericList([2])
        let result2 = partition(head2, 5)
        let expected2 = [2]
        XCTAssertEqual(genericListToArray(result2), expected2, "Should handle single node less than pivot")
    }
    
    func testHandlesAllNodesLessThanX() {
        let head = createGenericList([1, 2, 3, 4])
        let result = partition(head, 10)
        let resultArray = genericListToArray(result)
        
        // All values should be less than 10, order might change but all should be present
        XCTAssertEqual(resultArray.sorted(), [1, 2, 3, 4], "Should contain all values when all < pivot")
        for value in resultArray {
            XCTAssertLessThan(value, 10, "All values should be < pivot")
        }
    }
    
    func testHandlesAllNodesGreaterThanOrEqualToX() {
        let head = createGenericList([5, 6, 7, 8])
        let result = partition(head, 3)
        let resultArray = genericListToArray(result)
        
        // All values should be >= 3, order might change but all should be present
        XCTAssertEqual(resultArray.sorted(), [5, 6, 7, 8], "Should contain all values when all >= pivot")
        for value in resultArray {
            XCTAssertGreaterThanOrEqual(value, 3, "All values should be >= pivot")
        }
    }
    
    func testHandlesEmptyList() {
        let result = partition(nil as Node<Int>?, 5)
        XCTAssertNil(result, "Should handle empty list")
    }
    
    func testPartitionWithDuplicatesOfPivotValue() {
        let head = createGenericList([5, 3, 5, 2, 5, 7])
        let result = partition(head, 5)
        let resultArray = genericListToArray(result)
        
        // Should contain all original values
        XCTAssertEqual(resultArray.sorted(), [2, 3, 5, 5, 5, 7], "Should contain all original values including duplicates")
        
        // Find first occurrence of 5
        if let firstFiveIndex = resultArray.firstIndex(of: 5) {
            // Values before first 5 should be < 5
            for i in 0..<firstFiveIndex {
                XCTAssertLessThan(resultArray[i], 5, "Values before pivot should be < 5")
            }
        }
    }
}