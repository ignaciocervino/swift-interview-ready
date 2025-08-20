import XCTest
@testable import TechnicalFundamentalsSwift

final class LinkedListNodeTests: XCTestCase {
    
    func testNodeCreation() {
        let node1 = Node(value: 0)
        XCTAssertEqual(node1.value, 0)
        XCTAssertNil(node1.next)
        
        let node2 = Node(value: 5)
        XCTAssertEqual(node2.value, 5)
        XCTAssertNil(node2.next)
        
        let node3 = Node(value: 10, next: node2)
        XCTAssertEqual(node3.value, 10)
        XCTAssertEqual(node3.next?.value, 5)
    }
    
    func testGenericNodeCreation() {
        let intNode = Node(value: 42)
        XCTAssertEqual(intNode.value, 42)
        XCTAssertNil(intNode.next)
        
        let stringNode = Node(value: "hello")
        XCTAssertEqual(stringNode.value, "hello")
        XCTAssertNil(stringNode.next)
        
        let connectedNode = Node(value: 1, next: Node(value: 2))
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
        let head = Node(value: 1)
        head.next = Node(value: 2)
        head.next?.next = Node(value: 3)
        
        XCTAssertEqual(listToArray(head), [1, 2, 3])
        XCTAssertEqual(listToArray(nil), [])
    }
    
    func testGenericListToArrayHelper() {
        let head = Node(value: 1)
        head.next = Node(value: 2)
        head.next?.next = Node(value: 3)
        
        XCTAssertEqual(genericListToArray(head), [1, 2, 3])
        XCTAssertEqual(genericListToArray(nil as Node<Int>?), [])
    }
}