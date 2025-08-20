import XCTest
@testable import TechnicalFundamentalsSwift

final class TreesTests: XCTestCase {
    
    func testDFSNavigatesTreeInOrder() {
        /*
         Tree structure:
               1
              / \
             2   5
            / \ / \
           3  4 6  8
               /
              7
        */
        let node3 = TreeNode(value: 3)
        let node4 = TreeNode(value: 4)
        let node7 = TreeNode(value: 7)
        let node6 = TreeNode(value: 6, left: node7)
        let node8 = TreeNode(value: 8)
        let node2 = TreeNode(value: 2, left: node3, right: node4)
        let node5 = TreeNode(value: 5, left: node6, right: node8)
        let root = TreeNode(value: 1, left: node2, right: node5)
        
        let tree = Tree<Int>()
        var visitedValues: [Int] = []
        
        tree.dfs(node: root) { node in
            visitedValues.append(node.value)
        }
        
        // DFS should visit nodes in pre-order: 1, 2, 3, 4, 5, 6, 7, 8
        XCTAssertEqual(visitedValues, [1, 2, 3, 4, 5, 6, 7, 8])
    }
    
    func testBFSNavigatesTreeInOrder() {
        /*
         Tree structure:
               1
              / \
             2   3
            / \ / \
           4  5 6  7
          /
         8
        */
        let node8 = TreeNode(value: 8)
        let node4 = TreeNode(value: 4, left: node8)
        let node5 = TreeNode(value: 5)
        let node6 = TreeNode(value: 6)
        let node7 = TreeNode(value: 7)
        let node2 = TreeNode(value: 2, left: node4, right: node5)
        let node3 = TreeNode(value: 3, left: node6, right: node7)
        let root = TreeNode(value: 1, left: node2, right: node3)
        
        let tree = Tree<Int>()
        var visitedValues: [Int] = []
        
        tree.bfs(node: root) { node in
            visitedValues.append(node.value)
        }
        
        // BFS should visit nodes level by level: 1, 2, 3, 4, 5, 6, 7, 8
        XCTAssertEqual(visitedValues, [1, 2, 3, 4, 5, 6, 7, 8])
    }
    
    func testEmptyTreeDFS() {
        let tree = Tree<Int>()
        var visitedValues: [Int] = []
        
        tree.dfs(node: nil) { node in
            visitedValues.append(node.value)
        }
        
        XCTAssertEqual(visitedValues, [])
    }
    
    func testEmptyTreeBFS() {
        let tree = Tree<Int>()
        var visitedValues: [Int] = []
        
        tree.bfs(node: nil) { node in
            visitedValues.append(node.value)
        }
        
        XCTAssertEqual(visitedValues, [])
    }
}