import XCTest
@testable import TechnicalFundamentalsSwift

final class QueueViaStacksTests: XCTestCase {
    
    func testBasicEnqueueDequeueOperations() {
        let queue = MyQueue<Int>()
        
        // Test FIFO behavior
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssertFalse(queue.isEmpty(), "Queue should not be empty")
        
        XCTAssertEqual(queue.dequeue(), 1, "Should dequeue 1 (first in)")
        XCTAssertEqual(queue.dequeue(), 2, "Should dequeue 2 (second in)")
        XCTAssertEqual(queue.dequeue(), 3, "Should dequeue 3 (third in)")
        
        XCTAssertTrue(queue.isEmpty(), "Queue should be empty after all dequeues")
    }
    
    func testMixedEnqueueDequeueWithPeek() {
        let queue = MyQueue<String>()
        
        queue.enqueue("a")
        queue.enqueue("b")
        
        XCTAssertEqual(queue.peek(), "a", "Peek should return first element")
        XCTAssertEqual(queue.dequeue(), "a", "Should dequeue 'a'")
        
        queue.enqueue("c")
        XCTAssertEqual(queue.peek(), "b", "Peek should return 'b'")
        
        XCTAssertEqual(queue.dequeue(), "b", "Should dequeue 'b'")
        XCTAssertEqual(queue.dequeue(), "c", "Should dequeue 'c'")
        
        XCTAssertTrue(queue.isEmpty(), "Queue should be empty")
    }
    
    func testPeekFromEmptyQueueReturnsNil() {
        let queue = MyQueue<Int>()
        
        XCTAssertNil(queue.peek(), "Peek from empty queue should return nil")
        XCTAssertTrue(queue.isEmpty(), "Empty queue should report isEmpty as true")
    }
    
    func testDequeueFromEmptyQueueReturnsNil() {
        let queue = MyQueue<Int>()
        
        XCTAssertNil(queue.dequeue(), "Dequeue from empty queue should return nil")
        XCTAssertTrue(queue.isEmpty(), "Empty queue should report isEmpty as true")
    }
    
    func testIsEmptyMethod() {
        let queue = MyQueue<Int>()
        
        XCTAssertTrue(queue.isEmpty(), "New queue should be empty")
        
        queue.enqueue(1)
        XCTAssertFalse(queue.isEmpty(), "Queue with element should not be empty")
        
        queue.dequeue()
        XCTAssertTrue(queue.isEmpty(), "Queue should be empty after dequeuing all elements")
    }
    
    func testAlternatingEnqueueDequeue() {
        let queue = MyQueue<Int>()
        
        queue.enqueue(1)
        XCTAssertEqual(queue.dequeue(), 1, "Should dequeue 1")
        
        queue.enqueue(2)
        queue.enqueue(3)
        XCTAssertEqual(queue.dequeue(), 2, "Should dequeue 2")
        
        queue.enqueue(4)
        XCTAssertEqual(queue.dequeue(), 3, "Should dequeue 3")
        XCTAssertEqual(queue.dequeue(), 4, "Should dequeue 4")
        
        XCTAssertTrue(queue.isEmpty(), "Queue should be empty")
    }
}