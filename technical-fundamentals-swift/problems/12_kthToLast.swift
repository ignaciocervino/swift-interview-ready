// 2.  *Return Kth to Last*:

// Implement an algorithm to find the kth to last element of a singly linked list.

func kthToLast<T: Equatable & Hashable>(_ head: Node<T>?, _ k: Int) -> Node<T>? {
    guard let head else { return nil }
    let count = head.count
    let position = count - k
    var currentPosition = 0
    var ret: Node<T>? = nil

    head.forEach { node in 
        if currentPosition == position {
            ret = node 
        }
        currentPosition += 1
    }

    return ret
}