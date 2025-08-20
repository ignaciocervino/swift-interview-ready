import XCTest
@testable import TechnicalFundamentalsSwift

final class CheckBalancedTests: XCTestCase {
    
    func testCheckBalancedWithBalancedTree() {
        /*
         Balanced tree:
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
        
        XCTAssertTrue(checkBalanced(root))
    }
    
    func testCheckBalancedWithUnbalancedTree() {
        /*
         Unbalanced tree:
               1
              /
             2
            /
           3
        */
        let node3 = TreeNode(value: 3)
        let node2 = TreeNode(value: 2, left: node3)
        let root = TreeNode(value: 1, left: node2)
        
        XCTAssertFalse(checkBalanced(root))
    }
    
    func testCheckBalancedWithEmptyTree() {
        let result: Bool = checkBalanced(nil as TreeNode<Int>?)
        XCTAssertTrue(result)
    }
    
    func testCheckBalancedWithSingleNode() {
        let root = TreeNode(value: 1)
        XCTAssertTrue(checkBalanced(root))
    }
    
    func testCheckBalancedWithComplexBalancedTree() {
        /*
         Balanced tree:
               1
              / \
             2   3
            / \ / \
           4  5 6  7
        */
        let node4 = TreeNode(value: 4)
        let node5 = TreeNode(value: 5)
        let node6 = TreeNode(value: 6)
        let node7 = TreeNode(value: 7)
        let node2 = TreeNode(value: 2, left: node4, right: node5)
        let node3 = TreeNode(value: 3, left: node6, right: node7)
        let root = TreeNode(value: 1, left: node2, right: node3)
        
        XCTAssertTrue(checkBalanced(root))
    }
    
    func testCheckBalancedWithComplexUnbalancedTree() {
        /*
         Unbalanced tree:
               1
              / \
             2   3
            /   / \
           4   5   6
          /
         7
        */
        let node7 = TreeNode(value: 7)
        let node4 = TreeNode(value: 4, left: node7)
        let node5 = TreeNode(value: 5)
        let node6 = TreeNode(value: 6)
        let node2 = TreeNode(value: 2, left: node4)
        let node3 = TreeNode(value: 3, left: node5, right: node6)
        let root = TreeNode(value: 1, left: node2, right: node3)
        
        XCTAssertFalse(checkBalanced(root))
    }
}