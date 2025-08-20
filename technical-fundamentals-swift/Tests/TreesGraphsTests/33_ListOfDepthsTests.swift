import XCTest
@testable import TechnicalFundamentalsSwift

final class ListOfDepthsTests: XCTestCase {
    
    func testListOfDepthsWithBalancedTree() {
        /*
         Tree structure:
               1
              / \
             2   3
            / \
           4   5
        */
        let node4 = TreeNode(value: 4)
        let node5 = TreeNode(value: 5)
        let node2 = TreeNode(value: 2, left: node4, right: node5)
        let node3 = TreeNode(value: 3)
        let root = TreeNode(value: 1, left: node2, right: node3)
        
        let result = listOfDepths(root)
        
        XCTAssertEqual(result.count, 3) // 3 levels
        
        // Level 0: [1]
        XCTAssertEqual(result[0].value, 1)
        XCTAssertNil(result[0].next)
        
        // Level 1: [2, 3] (as linked list)
        let level1Values = genericListToArray(result[1])
        XCTAssertEqual(level1Values.count, 2)
        XCTAssertTrue(level1Values.contains(2))
        XCTAssertTrue(level1Values.contains(3))
        
        // Level 2: [4, 5] (as linked list)
        let level2Values = genericListToArray(result[2])
        XCTAssertEqual(level2Values.count, 2)
        XCTAssertTrue(level2Values.contains(4))
        XCTAssertTrue(level2Values.contains(5))
    }
    
    func testListOfDepthsWithSingleNode() {
        let root = TreeNode(value: 42)
        let result = listOfDepths(root)
        
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0].value, 42)
        XCTAssertNil(result[0].next)
    }
    
    func testListOfDepthsWithEmptyTree() {
        let result: [Node<Int>] = listOfDepths(nil)
        XCTAssertEqual(result.count, 0)
    }
    
    func testListOfDepthsWithUnbalancedTree() {
        /*
         Tree structure:
               1
              /
             2
            /
           3
        */
        let node3 = TreeNode(value: 3)
        let node2 = TreeNode(value: 2, left: node3)
        let root = TreeNode(value: 1, left: node2)
        
        let result = listOfDepths(root)
        
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result[0].value, 1)
        XCTAssertEqual(result[1].value, 2)
        XCTAssertEqual(result[2].value, 3)
    }
}