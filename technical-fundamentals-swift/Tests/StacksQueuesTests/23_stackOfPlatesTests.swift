import XCTest
@testable import TechnicalFundamentalsSwift

final class StackOfPlatesTests: XCTestCase {
    
    func testBasicPushPopWithCapacity3() {
        let setOfStacks = SetOfStacks<Int>(capacity: 3)
        
        // Fill first stack
        setOfStacks.push(1)
        setOfStacks.push(2)
        setOfStacks.push(3)
        
        // This should create a new stack
        setOfStacks.push(4)
        setOfStacks.push(5)
        
        // Test LIFO behavior
        XCTAssertEqual(setOfStacks.pop(), 5, "Should pop 5 (from second stack)")
        XCTAssertEqual(setOfStacks.pop(), 4, "Should pop 4 (from second stack)")
        XCTAssertEqual(setOfStacks.pop(), 3, "Should pop 3 (from first stack)")
        XCTAssertEqual(setOfStacks.pop(), 2, "Should pop 2 (from first stack)")
        XCTAssertEqual(setOfStacks.pop(), 1, "Should pop 1 (from first stack)")
    }
    
    func testMultipleStacksWithCapacity2() {
        let setOfStacks = SetOfStacks<String>(capacity: 2)
        
        // Fill multiple stacks
        setOfStacks.push("a")  // Stack 1
        setOfStacks.push("b")  // Stack 1 (full)
        setOfStacks.push("c")  // Stack 2
        setOfStacks.push("d")  // Stack 2 (full)
        setOfStacks.push("e")  // Stack 3
        setOfStacks.push("f")  // Stack 3 (full)
        setOfStacks.push("g")  // Stack 4
        
        // Test popping in reverse order
        XCTAssertEqual(setOfStacks.pop(), "g", "Should pop 'g'")
        XCTAssertEqual(setOfStacks.pop(), "f", "Should pop 'f'")
        XCTAssertEqual(setOfStacks.pop(), "e", "Should pop 'e'")
        XCTAssertEqual(setOfStacks.pop(), "d", "Should pop 'd'")
        XCTAssertEqual(setOfStacks.pop(), "c", "Should pop 'c'")
        XCTAssertEqual(setOfStacks.pop(), "b", "Should pop 'b'")
        XCTAssertEqual(setOfStacks.pop(), "a", "Should pop 'a'")
    }
    
    func testPopFromEmptyStackReturnsNil() {
        let setOfStacks = SetOfStacks<Int>(capacity: 3)
        
        XCTAssertNil(setOfStacks.pop(), "Pop from empty set of stacks should return nil")
    }
    
    func testPushBeyondCapacityCreatesNewStack() {
        let setOfStacks = SetOfStacks<Int>(capacity: 2)
        
        // Fill first stack
        setOfStacks.push(1)
        setOfStacks.push(2)
        
        // This should create second stack
        setOfStacks.push(3)
        
        // Pop should get the most recently added
        XCTAssertEqual(setOfStacks.pop(), 3, "Should pop from second stack")
        XCTAssertEqual(setOfStacks.pop(), 2, "Should pop from first stack")
        XCTAssertEqual(setOfStacks.pop(), 1, "Should pop from first stack")
        XCTAssertNil(setOfStacks.pop(), "Should return nil when empty")
    }
    
    func testSingleElementStacks() {
        let setOfStacks = SetOfStacks<Int>(capacity: 1)
        
        setOfStacks.push(10)
        setOfStacks.push(20)
        setOfStacks.push(30)
        
        XCTAssertEqual(setOfStacks.pop(), 30, "Should pop 30")
        XCTAssertEqual(setOfStacks.pop(), 20, "Should pop 20")
        XCTAssertEqual(setOfStacks.pop(), 10, "Should pop 10")
        XCTAssertNil(setOfStacks.pop(), "Should return nil")
    }
}