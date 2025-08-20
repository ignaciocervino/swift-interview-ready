import XCTest
@testable import TechnicalFundamentalsSwift

final class SuccessorTests: XCTestCase {
    
    func testSuccessorWithRightSubtree() {
        /*
         BST:
               4
              / \
             2   6
            / \ / \
           1  3 5  7
        */
        let node1 = TreeNode(value: 1)
        let node3 = TreeNode(value: 3)
        let node5 = TreeNode(value: 5)
        let node7 = TreeNode(value: 7)
        let node2 = TreeNode(value: 2, left: node1, right: node3)
        let node6 = TreeNode(value: 6, left: node5, right: node7)
        let root = TreeNode(value: 4, left: node2, right: node6)
        
        let result = successor(root, root) // Successor of 4 should be 5
        XCTAssertEqual(result?.value, 5)
    }
    
    func testSuccessorWithoutRightSubtree() {
        /*
         BST:
               4
              / \
             2   6
            / \ / \
           1  3 5  7
        */
        let node1 = TreeNode(value: 1)
        let node3 = TreeNode(value: 3)
        let node5 = TreeNode(value: 5)
        let node7 = TreeNode(value: 7)
        let node2 = TreeNode(value: 2, left: node1, right: node3)
        let node6 = TreeNode(value: 6, left: node5, right: node7)
        let root = TreeNode(value: 4, left: node2, right: node6)
        
        let result = successor(root, node3) // Successor of 3 should be 4
        XCTAssertEqual(result?.value, 4)
    }
    
    func testSuccessorOfLeftmostNode() {
        /*
         BST:
               4
              / \
             2   6
            / \ / \
           1  3 5  7
        */
        let node1 = TreeNode(value: 1)
        let node3 = TreeNode(value: 3)
        let node5 = TreeNode(value: 5)
        let node7 = TreeNode(value: 7)
        let node2 = TreeNode(value: 2, left: node1, right: node3)
        let node6 = TreeNode(value: 6, left: node5, right: node7)
        let root = TreeNode(value: 4, left: node2, right: node6)
        
        let result = successor(root, node1) // Successor of 1 should be 2
        XCTAssertEqual(result?.value, 2)
    }
    
    func testSuccessorOfRightmostNode() {
        /*
         BST:
               4
              / \
             2   6
            / \ / \
           1  3 5  7
        */
        let node1 = TreeNode(value: 1)
        let node3 = TreeNode(value: 3)
        let node5 = TreeNode(value: 5)
        let node7 = TreeNode(value: 7)
        let node2 = TreeNode(value: 2, left: node1, right: node3)
        let node6 = TreeNode(value: 6, left: node5, right: node7)
        let root = TreeNode(value: 4, left: node2, right: node6)
        
        let result = successor(root, node7) // Successor of 7 (rightmost) should be nil
        XCTAssertNil(result)
    }
    
    func testSuccessorOfSingleNode() {
        let root = TreeNode(value: 5)
        let result = successor(root, root)
        XCTAssertNil(result)
    }
}