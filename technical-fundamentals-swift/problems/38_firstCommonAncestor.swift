// 8. *First Common Ancestor*:

// Design an algorithm and write code to find the first common ancestor of two nodes
// in a binary tree. Avoid storing additional nodes in a data structure.
// NOTE: This is not necessarily a binary search tree.

public func firstCommonAncestor<T: Equatable & Hashable>(_ root: TreeNode<T>?, _ p: TreeNode<T>, _ q: TreeNode<T>) -> TreeNode<T>? {
    var hasP = false
    var hasQ = false
    dfsPreOrder(root) { node in 
        if node == q {
            hasQ = true
        }
        if node == p {
            hasP = true
        }
    }

    guard hasP, hasQ else { return nil }
    return lca(root, p, q)
}

public func lca<T: Equatable & Hashable>(_ root: TreeNode<T>?, _ p: TreeNode<T>, _ q: TreeNode<T>) -> TreeNode<T>? {
    guard let root else { return nil }

    if root == p || root == q {
        return root
    }

    let left = lca(root.left, p, q)
    let right = lca(root.right, p, q)

    if let right, let left {
        return root
    } else if let left {
        return left
    } else if let right {
        return right
    }

    return nil
}

public func dfsPreOrder<T: Equatable & Hashable>(_ root: TreeNode<T>?, _ visit: (TreeNode<T>) -> Void) {
    guard let root else { return }

    visit(root)
    dfsPreOrder(root.left, visit)
    dfsPreOrder(root.right, visit)

}