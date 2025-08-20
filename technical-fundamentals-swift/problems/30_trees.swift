// Write the basic tree algorithms of Depth-first-search and Breadth-first search.

public class TreeNode<T: Equatable & Hashable> {
    public var value: T
    public var left: TreeNode<T>?
    public var right: TreeNode<T>?
    public var parent: TreeNode<T>?
    
    public init(value: T, left: TreeNode<T>? = nil, right: TreeNode<T>? = nil, parent: TreeNode<T>? = nil) {
        self.value = value
        self.left = left
        self.right = right
        self.parent = parent
    }
}

public class GraphNode {
    public var value: Int
    public var neighbors: [GraphNode]
    
    public init(value: Int, neighbors: [GraphNode] = []) {
        self.value = value
        self.neighbors = neighbors
    }
}

public class Tree<T: Equatable & Hashable> {
    public init() {}
    
    public func bfs(node: TreeNode<T>?, visit: (TreeNode<T>) -> Void) {
        
    }
    
    public func dfs(node: TreeNode<T>?, visit: (TreeNode<T>) -> Void) {
        
    }
}