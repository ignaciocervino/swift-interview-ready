import XCTest
@testable import TechnicalFundamentalsSwift

final class ThreeStacksTests: XCTestCase {
    
    func testPushPopElementsFromEachStack() {
        let threeStacks = ThreeStacks<Int>(arrayLength: 9)
        
        // Push to stack 0
        threeStacks.push(stackNum: 0, value: 1)
        threeStacks.push(stackNum: 0, value: 2)
        
        // Push to stack 1
        threeStacks.push(stackNum: 1, value: 10)
        threeStacks.push(stackNum: 1, value: 20)
        
        // Push to stack 2
        threeStacks.push(stackNum: 2, value: 100)
        threeStacks.push(stackNum: 2, value: 200)
        
        // Test peek
        XCTAssertEqual(threeStacks.peek(stackNum: 0), 2, "Stack 0 top should be 2")
        XCTAssertEqual(threeStacks.peek(stackNum: 1), 20, "Stack 1 top should be 20")
        XCTAssertEqual(threeStacks.peek(stackNum: 2), 200, "Stack 2 top should be 200")
        
        // Test pop
        XCTAssertEqual(threeStacks.pop(stackNum: 0), 2, "Should pop 2 from stack 0")
        XCTAssertEqual(threeStacks.pop(stackNum: 1), 20, "Should pop 20 from stack 1")
        XCTAssertEqual(threeStacks.pop(stackNum: 2), 200, "Should pop 200 from stack 2")
        
        // Test remaining elements
        XCTAssertEqual(threeStacks.peek(stackNum: 0), 1, "Stack 0 top should now be 1")
        XCTAssertEqual(threeStacks.peek(stackNum: 1), 10, "Stack 1 top should now be 10")
        XCTAssertEqual(threeStacks.peek(stackNum: 2), 100, "Stack 2 top should now be 100")
    }
    
    func testPopFromEmptyStacksReturnsNil() {
        let threeStacks = ThreeStacks<Int>(arrayLength: 3)
        
        XCTAssertNil(threeStacks.pop(stackNum: 0), "Pop from empty stack 0 should return nil")
        XCTAssertNil(threeStacks.pop(stackNum: 1), "Pop from empty stack 1 should return nil")
        XCTAssertNil(threeStacks.pop(stackNum: 2), "Pop from empty stack 2 should return nil")
    }
    
    func testPeekFromEmptyStacksReturnsNil() {
        let threeStacks = ThreeStacks<Int>(arrayLength: 3)
        
        XCTAssertNil(threeStacks.peek(stackNum: 0), "Peek from empty stack 0 should return nil")
        XCTAssertNil(threeStacks.peek(stackNum: 1), "Peek from empty stack 1 should return nil")
        XCTAssertNil(threeStacks.peek(stackNum: 2), "Peek from empty stack 2 should return nil")
    }
    
    func testSmallArrayLength() {
        let threeStacks = ThreeStacks<String>(arrayLength: 3)
        
        threeStacks.push(stackNum: 0, value: "a")
        threeStacks.push(stackNum: 1, value: "b")
        threeStacks.push(stackNum: 2, value: "c")
        
        XCTAssertEqual(threeStacks.peek(stackNum: 0), "a", "Stack 0 should contain 'a'")
        XCTAssertEqual(threeStacks.peek(stackNum: 1), "b", "Stack 1 should contain 'b'")
        XCTAssertEqual(threeStacks.peek(stackNum: 2), "c", "Stack 2 should contain 'c'")
    }
}