import XCTest
@testable import TechnicalFundamentalsSwift

final class StackMinTests: XCTestCase {
    
    func testPushPopWithMinTracking() {
        let stackMin = StackMin<Int>()
        
        // Test sequence: 5, 2, 8, 1
        stackMin.push(5)
        XCTAssertEqual(stackMin.min(), 5, "Min should be 5 after pushing 5")
        
        stackMin.push(2)
        XCTAssertEqual(stackMin.min(), 2, "Min should be 2 after pushing 2")
        
        stackMin.push(8)
        XCTAssertEqual(stackMin.min(), 2, "Min should still be 2 after pushing 8")
        
        stackMin.push(1)
        XCTAssertEqual(stackMin.min(), 1, "Min should be 1 after pushing 1")
        
        // Test popping while maintaining correct min
        XCTAssertEqual(stackMin.pop(), 1, "Should pop 1")
        XCTAssertEqual(stackMin.min(), 2, "Min should return to 2 after popping 1")
        
        XCTAssertEqual(stackMin.pop(), 8, "Should pop 8")
        XCTAssertEqual(stackMin.min(), 2, "Min should still be 2 after popping 8")
        
        XCTAssertEqual(stackMin.pop(), 2, "Should pop 2")
        XCTAssertEqual(stackMin.min(), 5, "Min should return to 5 after popping 2")
        
        XCTAssertEqual(stackMin.pop(), 5, "Should pop 5")
        XCTAssertNil(stackMin.min(), "Min should be nil after popping all elements")
    }
    
    func testMinReturnsNilWhenStackIsEmpty() {
        let stackMin = StackMin<Int>()
        
        XCTAssertNil(stackMin.min(), "Min should return nil when stack is empty")
    }
    
    func testMixedPushPopOperations() {
        let stackMin = StackMin<Int>()
        
        stackMin.push(10)
        stackMin.push(5)
        XCTAssertEqual(stackMin.min(), 5, "Min should be 5")
        
        stackMin.push(3)
        XCTAssertEqual(stackMin.min(), 3, "Min should be 3")
        
        XCTAssertEqual(stackMin.pop(), 3, "Should pop 3")
        XCTAssertEqual(stackMin.min(), 5, "Min should return to 5")
        
        stackMin.push(1)
        XCTAssertEqual(stackMin.min(), 1, "Min should be 1")
        
        stackMin.push(7)
        XCTAssertEqual(stackMin.min(), 1, "Min should still be 1")
    }
    
    func testStringStackMin() {
        let stackMin = StackMin<String>()
        
        stackMin.push("zebra")
        stackMin.push("apple")
        stackMin.push("banana")
        
        XCTAssertEqual(stackMin.min(), "apple", "Min should be 'apple' lexicographically")
        
        XCTAssertEqual(stackMin.pop(), "banana", "Should pop 'banana'")
        XCTAssertEqual(stackMin.min(), "apple", "Min should still be 'apple'")
    }
}