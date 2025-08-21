// 4. *Check Balanced*:

// Implement a function to check if a binary tree is balanced.
// For the purposes of this question, a balanced tree is defined to be a tree
// such that the heights of the two subtrees of any node never differ by more than one.

public func checkBalanced<T: Equatable & Hashable>(_ tree: TreeNode<T>?) -> Bool {
    var flag = false
    dfs(node: tree, flag: &flag)
    return !flag
}

public func height<T: Equatable & Hashable>(node: TreeNode<T>?) -> Int {
    if node == nil {
        return 0
    }

    return 1 + max(height(node: node?.left), height(node: node?.right) )
}

public func dfs<T: Equatable & Hashable>(node: TreeNode<T>?, flag: inout Bool) {
    guard let node, !flag else { return }

    dfs(node: node.left, flag: &flag)
    dfs(node: node.right, flag: &flag)

    if abs(height(node: node.left) - height(node: node.right)) > 1 {
        flag = true
    }
}