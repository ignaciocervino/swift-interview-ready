import XCTest
@testable import TechnicalFundamentalsSwift

final class FirstCommonAncestorTests: XCTestCase {
    
    func testFirstCommonAncestorInDifferentSubtrees() {
        /*
         Tree:
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
        
        let result = firstCommonAncestor(root, node4, node5)
        XCTAssertEqual(result?.value, 2) // LCA of 4 and 5 is 2
        
        let result2 = firstCommonAncestor(root, node4, node6)
        XCTAssertEqual(result2?.value, 1) // LCA of 4 and 6 is 1
        
        let result3 = firstCommonAncestor(root, node6, node7)
        XCTAssertEqual(result3?.value, 3) // LCA of 6 and 7 is 3
    }
    
    func testFirstCommonAncestorSameNode() {
        /*
         Tree:
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
        
        let result = firstCommonAncestor(root, node4, node4)
        XCTAssertEqual(result?.value, 4) // LCA of same node is the node itself
    }
    
    func testFirstCommonAncestorOneIsAncestorOfOther() {
        /*
         Tree:
               1
              / \
             2   3
            / \
           4   5
          /
         8
        */
        let node8 = TreeNode(value: 8)
        let node4 = TreeNode(value: 4, left: node8)
        let node5 = TreeNode(value: 5)
        let node2 = TreeNode(value: 2, left: node4, right: node5)
        let node3 = TreeNode(value: 3)
        let root = TreeNode(value: 1, left: node2, right: node3)
        
        let result = firstCommonAncestor(root, node2, node8)
        XCTAssertEqual(result?.value, 2) // LCA of 2 and 8 is 2 (2 is ancestor of 8)
        
        let result2 = firstCommonAncestor(root, node8, node2)
        XCTAssertEqual(result2?.value, 2) // Order shouldn't matter
    }
    
    func testFirstCommonAncestorNodeNotInTree() {
        /*
         Tree:
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
        
        let outsideNode = TreeNode(value: 99)
        
        let result = firstCommonAncestor(root, node4, outsideNode)
        XCTAssertNil(result) // Should return nil if one node is not in tree
    }
    
    func testFirstCommonAncestorWithRoot() {
        /*
         Tree:
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
        
        let result = firstCommonAncestor(root, root, node4)
        XCTAssertEqual(result?.value, 1) // LCA of root and any descendant is root
    }
    
    func testFirstCommonAncestorSingleNode() {
        let root = TreeNode(value: 1)
        
        let result = firstCommonAncestor(root, root, root)
        XCTAssertEqual(result?.value, 1)
    }
    
    func testFirstCommonAncestorComplexTree() {
        /*
         Tree:
                    1
                  /   \
                 2     3
               /  \   /  \
              4    5 6    7
             / \    \    /
            8   9   10  11
        */
        let node8 = TreeNode(value: 8)
        let node9 = TreeNode(value: 9)
        let node10 = TreeNode(value: 10)
        let node11 = TreeNode(value: 11)
        let node4 = TreeNode(value: 4, left: node8, right: node9)
        let node5 = TreeNode(value: 5, right: node10)
        let node6 = TreeNode(value: 6)
        let node7 = TreeNode(value: 7, left: node11)
        let node2 = TreeNode(value: 2, left: node4, right: node5)
        let node3 = TreeNode(value: 3, left: node6, right: node7)
        let root = TreeNode(value: 1, left: node2, right: node3)
        
        let result = firstCommonAncestor(root, node8, node10)
        XCTAssertEqual(result?.value, 2) // LCA of 8 and 10 is 2
        
        let result2 = firstCommonAncestor(root, node9, node11)
        XCTAssertEqual(result2?.value, 1) // LCA of 9 and 11 is 1
        
        let result3 = firstCommonAncestor(root, node8, node9)
        XCTAssertEqual(result3?.value, 4) // LCA of 8 and 9 is 4
    }
}