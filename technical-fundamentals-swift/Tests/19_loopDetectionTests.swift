import XCTest
@testable import TechnicalFundamentalsSwift

final class LoopDetectionTests: XCTestCase {
    
    func testReturnsNilForSingleNode() {
        let head = createGenericList([1])
        let result = detectLoop(head)
        XCTAssertNil(result, "Should return nil for single node without loop")
    }
    
    func testReturnsNilIfNoLoop() {
        let head = createGenericList([1, 2, 3, 4, 5])
        let result = detectLoop(head)
        XCTAssertNil(result, "Should return nil if no loop exists")
    }
    
    func testReturnsCorrectLoopStartNode() {
        // Create list: A->B->C->D->E->C (loop back to C)
        let nodeA = Node(value: "A")
        let nodeB = Node(value: "B")
        let nodeC = Node(value: "C")
        let nodeD = Node(value: "D")
        let nodeE = Node(value: "E")
        
        nodeA.next = nodeB
        nodeB.next = nodeC
        nodeC.next = nodeD
        nodeD.next = nodeE
        nodeE.next = nodeC // Creates loop back to C
        
        let result = detectLoop(nodeA)
        XCTAssertTrue(result === nodeC, "Should return node C as loop start")
        XCTAssertEqual(result?.value, "C", "Loop should start at node with value C")
    }
    
    func testHandlesLoopAtHead() {
        // Create list where head points back to itself: A->A
        let nodeA = Node(value: "A")
        nodeA.next = nodeA
        
        let result = detectLoop(nodeA)
        XCTAssertTrue(result === nodeA, "Should detect loop at head")
        XCTAssertEqual(result?.value, "A", "Should return head node")
    }
    
    func testHandlesLongerLoop() {
        // Create list: 1->2->3->4->5->6->3 (loop back to 3)
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        let node4 = Node(value: 4)
        let node5 = Node(value: 5)
        let node6 = Node(value: 6)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node3 // Loop back to node3
        
        let result = detectLoop(node1)
        XCTAssertTrue(result === node3, "Should detect loop start at node 3")
        XCTAssertEqual(result?.value, 3, "Should return correct loop start value")
    }
    
    func testHandlesEmptyList() {
        let result = detectLoop(nil as Node<Int>?)
        XCTAssertNil(result, "Should return nil for empty list")
    }
    
    func testHandlesTwoNodeLoop() {
        // Create list: A->B->A (loop back to A)
        let nodeA = Node(value: "A")
        let nodeB = Node(value: "B")
        
        nodeA.next = nodeB
        nodeB.next = nodeA // Loop back to A
        
        let result = detectLoop(nodeA)
        XCTAssertTrue(result === nodeA, "Should detect loop start at A")
        XCTAssertEqual(result?.value, "A", "Should return A as loop start")
    }
    
    func testHandlesLongListWithSmallLoop() {
        // Create long list with small loop at the end
        let nodes = (1...10).map { Node(value: $0) }
        
        // Connect nodes 1->2->3->...->10
        for i in 0..<nodes.count - 1 {
            nodes[i].next = nodes[i + 1]
        }
        
        // Create loop: 10->8 (loop back to node 8)
        nodes[9].next = nodes[7] // node 10 points to node 8
        
        let result = detectLoop(nodes[0])
        XCTAssertTrue(result === nodes[7], "Should detect loop start at node 8")
        XCTAssertEqual(result?.value, 8, "Should return correct loop start value")
    }
}