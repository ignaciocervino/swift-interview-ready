// 5. *Validate BST*:

// Implement a function to check if a binary tree is a binary search tree.

public func validateBST<T: Equatable & Hashable & Comparable>(_ node: TreeNode<T>?) -> Bool {
    guard let node else { return true }
    return isValidBST(node, nil, nil)
}

public func isValidBST<T: Equatable & Hashable & Comparable>(_ node: TreeNode<T>?, _ lowerBound: T?, _ upperBound: T?) -> Bool {
    guard let node else { return true }
    
    if let upperBound, node.value >= upperBound {
        return false
    }

    if let lowerBound, node.value <= lowerBound {    
        return false
    }

    return isValidBST(node.left, lowerBound, node.value) && isValidBST(node.right, node.value, upperBound)
}