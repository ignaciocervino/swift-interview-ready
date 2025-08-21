// 4. *Check Balanced*:

// Implement a function to check if a binary tree is balanced.
// For the purposes of this question, a balanced tree is defined to be a tree
// such that the heights of the two subtrees of any node never differ by more than one.

// MARK: - First approach
// public func checkBalanced<T: Equatable & Hashable>(_ tree: TreeNode<T>?) -> Bool {
//     var flag = false
//     dfs(node: tree, flag: &flag)
//     return !flag
// }

// MARK: - With memo
public func checkBalanced<T: Equatable & Hashable>(_ tree: TreeNode<T>?) -> Bool {
    var flag = false
    var heightMemo = Dictionary<TreeNode<T>, Int>()
    dfs(node: tree, flag: &flag, &heightMemo)
    return !flag
}

public func height<T: Equatable & Hashable>(node: TreeNode<T>?, _ memo: inout Dictionary<TreeNode<T>, Int>) -> Int {
    guard let node else { return 0 }

    if let cached = memo[node] {
        return cached
    } 

    memo[node] =  1 + max(height(node: node.left, &memo), height(node: node.right, &memo) )
    return memo[node]!
}

public func dfs<T: Equatable & Hashable>(node: TreeNode<T>?, flag: inout Bool, _ memo: inout Dictionary<TreeNode<T>, Int>) {
    guard let node, !flag else { return }

    dfs(node: node.left, flag: &flag, &memo)
    dfs(node: node.right, flag: &flag, &memo)

    if abs(height(node: node.left, &memo) - height(node: node.right, &memo)) > 1 {
        flag = true
    }
}