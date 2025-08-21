// Write the basic tree algorithms of Depth-first-search and Breadth-first search.

public class TreeNode<T: Equatable & Hashable>: Hashable & Equatable {
    public var value: T
    public var left: TreeNode<T>?
    public var right: TreeNode<T>?
    
    public init(value: T, left: TreeNode<T>? = nil, right: TreeNode<T>? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    public static func == (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        lhs === rhs
    }
}

public class Tree<T: Equatable & Hashable> {
    public init() {}
    
    // O(n^2) version - because removeFirst is O(n)
    // public func bfs(_ node: TreeNode<T>?, _ visit: (TreeNode<T>) -> Void) {
    //     var queue = [node]
        
    //     while !queue.isEmpty, let child = queue.removeFirst() {
    //         visit(child)
    //         queue.append(child.left)
    //         queue.append(child.right)
    //     }
    // }

    // O(n) version
    public func bfs(_ node: TreeNode<T>?, _ visit: (TreeNode<T>) -> Void) {
        guard let node else { return }
        var queue = [node]
        var head = 0

        while head < queue.count {
            let currNode = queue[head]
            head += 1
            visit(currNode)
            if let left = currNode.left { queue.append(left) }
            if let right = currNode.right { queue.append(right) }
        }
    }
    
    public func dfs(_ node: TreeNode<T>?, _ visit: (TreeNode<T>) -> Void) {
        guard let node else { return }
        visit(node)
        dfs(node.left, visit)
        dfs(node.right, visit)
    }
}