// Write the basic tree algorithms of Depth-first-search and Breadth-first search.

public class TreeNode<T: Equatable & Hashable> {
    public var value: T
    public var left: TreeNode<T>?
    public var right: TreeNode<T>?
    
    public init(value: T, left: TreeNode<T>? = nil, right: TreeNode<T>? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

public class Tree<T: Equatable & Hashable> {
    public init() {}
    
    public func bfs(node: TreeNode<T>?, visit: (TreeNode<T>) -> Void) {
        
    }
    
    public func dfs(node: TreeNode<T>?, visit: (TreeNode<T>) -> Void) {
        
    }
}