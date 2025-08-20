import XCTest
@testable import TechnicalFundamentalsSwift

final class HasRouteBetweenNodesTests: XCTestCase {
    
    func testHasRouteBetweenConnectedNodes() {
        /*
         Graph:
         1 -> 2 -> 3 -> 4
         |         |
         5         6
        */
        let node1 = GraphNode(value: 1)
        let node2 = GraphNode(value: 2)
        let node3 = GraphNode(value: 3)
        let node4 = GraphNode(value: 4)
        let node5 = GraphNode(value: 5)
        let node6 = GraphNode(value: 6)
        
        node1.neighbors = [node2, node5]
        node2.neighbors = [node3]
        node3.neighbors = [node4, node6]
        node6.neighbors = [node3] // Add a back edge for cycle
        
        XCTAssertTrue(hasRouteBetweenNodes(start: node1, end: node4))
        XCTAssertFalse(hasRouteBetweenNodes(start: node4, end: node1)) // No reverse route
        XCTAssertFalse(hasRouteBetweenNodes(start: node2, end: node5)) // No direct route
        XCTAssertTrue(hasRouteBetweenNodes(start: node1, end: node6)) // Route via node 3
    }
    
    func testNoRouteBetweenDisconnectedNodes() {
        /*
         Graph:
         1   2   3
         |___|___|
        */
        let node1 = GraphNode(value: 1)
        let node2 = GraphNode(value: 2)
        let node3 = GraphNode(value: 3)
        
        XCTAssertFalse(hasRouteBetweenNodes(start: node1, end: node2)) // Disconnected nodes
        XCTAssertFalse(hasRouteBetweenNodes(start: node2, end: node3)) // Disconnected nodes
        XCTAssertFalse(hasRouteBetweenNodes(start: node1, end: node3)) // Disconnected nodes
    }
    
    func testSameNodeHasRoute() {
        let node1 = GraphNode(value: 1)
        XCTAssertTrue(hasRouteBetweenNodes(start: node1, end: node1))
    }
    
    func testDirectConnection() {
        let node1 = GraphNode(value: 1)
        let node2 = GraphNode(value: 2)
        
        node1.neighbors = [node2]
        
        XCTAssertTrue(hasRouteBetweenNodes(start: node1, end: node2))
        XCTAssertFalse(hasRouteBetweenNodes(start: node2, end: node1))
    }
}