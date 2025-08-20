// 2. *Minimal Tree*:

// Given a sorted (increasing order) array with unique integer elements,
// write an algorithm to create a binary search tree with minimal height.
//
// A binary search tree is a search where for each node,
// lesser elements are on the left node, and greater elements on the right node.
//
// Input: [1,2,3,4,5,6,7,8]
// Output:
//      5
//   2  |  7
// 1   3|6   8
//
//

public func minimalTree<T: Equatable & Hashable>(_ sortedArray: [T]) -> TreeNode<T>? {
    guard !sortedArray.isEmpty else { return nil }
    return minimalBST(sortedArray, start: 0, end: sortedArray.count - 1)
}

public func minimalBST<T: Equatable & Hashable>(_ array: [T], start: Int, end: Int) -> TreeNode<T>? {
    guard start <= end else { return nil }
    let middle = (start + end + 1) / 2
    let node = TreeNode(value: array[middle])

    node.left = minimalBST(array, start: start, end: middle - 1)
    node.right = minimalBST(array, start: middle + 1, end: end)

    return node
}