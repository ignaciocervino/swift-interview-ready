// 3. *List of Depths*:

// Given a binary tree, design an algorithm which creates a linked list
// of all the nodes at each depth (e.g., if you have a tree with depth D,
// you'll have D linked lists).

public func listOfDepths<T: Equatable & Hashable>(_ root: TreeNode<T>?) -> [Node<T>] {
    var ret = [Node<T>]()
    dfs(root, &ret, 0)
    return ret
}

public func dfs<T: Equatable & Hashable>(_ node: TreeNode<T>?, _ lists: inout [Node<T>], _ level: Int) {
    guard let node else { return }
    var currentList: Node<T>
    if level < lists.count {
        currentList = lists[level]
        var p: Node<T>? = currentList
        while p != nil {
            if p!.next == nil {
                p!.next = Node(value: node.value)
                break
            }
        
            p = p!.next
        }
    } else {
        lists.append(Node(value: node.value))
    }

    dfs(node.left, &lists, level + 1)
    dfs(node.right, &lists, level + 1)
}