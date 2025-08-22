// 6. *Successor*:

// Write an algorithm to find the "next" node
// (i.e., in-order successor) of a given node in a binary search tree.
// You may assume that each node has a link to its parent.

public func successor<T: Equatable & Hashable>(_ root: TreeNode<T>?, _ node: TreeNode<T>) -> TreeNode<T>? {
    var array = [TreeNode<T>]()
    var position: Int? = nil
    dfsInOrder(root, &array, &position, node)
    if let position, position < array.count - 1 {
        return array[position+1]
    } else {
        return nil   
    }
}

public func dfsInOrder<T: Equatable & Hashable>(_ node: TreeNode<T>?, _ array: inout [TreeNode<T>], _ position: inout Int?, _ requestedNode: TreeNode<T>) {
    guard let node else { return }

    dfsInOrder(node.left, &array, &position, requestedNode)
    array.append(node)
    if node === requestedNode {
       position = array.count - 1
    }
    dfsInOrder(node.right, &array, &position, requestedNode)
}