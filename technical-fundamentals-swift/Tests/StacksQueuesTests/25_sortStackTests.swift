import XCTest
@testable import TechnicalFundamentalsSwift

final class SortStackTests: XCTestCase {
    
    func testPushElementsMaintainingSortOrder() {
        let sortStack = SortStack<Int>()
        
        // Push elements in random order
        sortStack.push(5)
        sortStack.push(2)
        sortStack.push(8)
        sortStack.push(1)
        sortStack.push(4)
        
        // Smallest should be on top
        XCTAssertEqual(sortStack.peek(), 1, "Smallest element (1) should be on top")
        XCTAssertFalse(sortStack.isEmpty(), "Stack should not be empty")
    }
    
    func testPopElementsInSortedOrder() {
        let sortStack = SortStack<Int>()
        
        // Push elements
        sortStack.push(3)
        sortStack.push(1)
        sortStack.push(4)
        sortStack.push(2)
        sortStack.push(5)
        
        // Pop should return elements in sorted order (smallest to largest)
        XCTAssertEqual(sortStack.pop(), 1, "Should pop 1 (smallest)")
        XCTAssertEqual(sortStack.pop(), 2, "Should pop 2")
        XCTAssertEqual(sortStack.pop(), 3, "Should pop 3")
        XCTAssertEqual(sortStack.pop(), 4, "Should pop 4")
        XCTAssertEqual(sortStack.pop(), 5, "Should pop 5 (largest)")
        
        XCTAssertTrue(sortStack.isEmpty(), "Stack should be empty after all pops")
    }
    
    func testPeekReturnsTopElementWithoutRemoving() {
        let sortStack = SortStack<Int>()
        
        sortStack.push(10)
        sortStack.push(5)
        sortStack.push(15)
        
        XCTAssertEqual(sortStack.peek(), 5, "Peek should return smallest element (5)")
        XCTAssertEqual(sortStack.peek(), 5, "Peek should return same element without removing")
        XCTAssertFalse(sortStack.isEmpty(), "Stack should not be empty after peek")
        
        XCTAssertEqual(sortStack.pop(), 5, "Pop should return same element that peek returned")
    }
    
    func testIsEmptyMethod() {
        let sortStack = SortStack<Int>()
        
        XCTAssertTrue(sortStack.isEmpty(), "New stack should be empty")
        
        sortStack.push(1)
        XCTAssertFalse(sortStack.isEmpty(), "Stack with element should not be empty")
        
        sortStack.pop()
        XCTAssertTrue(sortStack.isEmpty(), "Stack should be empty after popping all elements")
    }
    
    func testEmptyStackOperations() {
        let sortStack = SortStack<Int>()
        
        XCTAssertNil(sortStack.pop(), "Pop from empty stack should return nil")
        XCTAssertNil(sortStack.peek(), "Peek from empty stack should return nil")
        XCTAssertTrue(sortStack.isEmpty(), "Empty stack should report isEmpty as true")
    }
    
    func testStringSort() {
        let sortStack = SortStack<String>()
        
        sortStack.push("zebra")
        sortStack.push("apple")
        sortStack.push("banana")
        sortStack.push("cherry")
        
        // Should be sorted lexicographically
        XCTAssertEqual(sortStack.pop(), "apple", "Should pop 'apple' (lexicographically first)")
        XCTAssertEqual(sortStack.pop(), "banana", "Should pop 'banana'")
        XCTAssertEqual(sortStack.pop(), "cherry", "Should pop 'cherry'")
        XCTAssertEqual(sortStack.pop(), "zebra", "Should pop 'zebra' (lexicographically last)")
    }
    
    func testSingleElement() {
        let sortStack = SortStack<Int>()
        
        sortStack.push(42)
        
        XCTAssertEqual(sortStack.peek(), 42, "Single element should be on top")
        XCTAssertEqual(sortStack.pop(), 42, "Should pop single element")
        XCTAssertTrue(sortStack.isEmpty(), "Stack should be empty after popping single element")
    }
}