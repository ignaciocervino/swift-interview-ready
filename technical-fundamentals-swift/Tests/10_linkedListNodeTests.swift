import XCTest
@testable import TechnicalFundamentalsSwift

final class LinkedListNodeTests: XCTestCase {
    
    func testListNodeCreation() {
        let node1 = ListNode()
        XCTAssertEqual(node1.val, 0)
        XCTAssertNil(node1.next)
        
        let node2 = ListNode(5)
        XCTAssertEqual(node2.val, 5)
        XCTAssertNil(node2.next)
        
        let node3 = ListNode(10, node2)
        XCTAssertEqual(node3.val, 10)
        XCTAssertEqual(node3.next?.val, 5)
    }
    
    func testGenericNodeCreation() {
        let intNode = Node(42)
        XCTAssertEqual(intNode.value, 42)
        XCTAssertNil(intNode.next)
        
        let stringNode = Node("hello")
        XCTAssertEqual(stringNode.value, "hello")
        XCTAssertNil(stringNode.next)
        
        let connectedNode = Node(1, Node(2))
        XCTAssertEqual(connectedNode.value, 1)
        XCTAssertEqual(connectedNode.next?.value, 2)
    }
    
    func testCreateListHelper() {
        let list = createList([1, 2, 3, 4])
        XCTAssertEqual(listToArray(list), [1, 2, 3, 4])
        
        let emptyList = createList([])
        XCTAssertNil(emptyList)
        
        let singleList = createList([5])
        XCTAssertEqual(listToArray(singleList), [5])
    }
    
    func testCreateGenericListHelper() {
        let intList = createGenericList([1, 2, 3])
        XCTAssertEqual(genericListToArray(intList), [1, 2, 3])
        
        let stringList = createGenericList(["a", "b", "c"])
        XCTAssertEqual(genericListToArray(stringList), ["a", "b", "c"])
        
        let emptyList = createGenericList([Int]())
        XCTAssertNil(emptyList)
    }
    
    func testListToArrayHelper() {
        let head = ListNode(1)
        head.next = ListNode(2)
        head.next?.next = ListNode(3)
        
        XCTAssertEqual(listToArray(head), [1, 2, 3])
        XCTAssertEqual(listToArray(nil), [])
    }
    
    func testGenericListToArrayHelper() {
        let head = Node(1)
        head.next = Node(2)
        head.next?.next = Node(3)
        
        XCTAssertEqual(genericListToArray(head), [1, 2, 3])
        XCTAssertEqual(genericListToArray(nil as Node<Int>?), [])
    }
}