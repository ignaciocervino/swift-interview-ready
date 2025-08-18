// 1. *Remove Dups*:

// Write code to remove duplicates from an unsorted linked list. FOLLOW UP
// How would you solve this problem if a temporary buffer is not allowed?
//
// 1 -> 2 -> 2-> 2 -> 4

func removeDups<T: Equatable & Hashable>(_ head: Node<T>?) -> Node<T>? {
    guard let head else { return nil }
    
    var buffer: Set<T> = [head.value]
    var current: Node<T>? = head

    head.forEach { node in
        if buffer.insert(node.value).inserted {
            current = node
        } else {
            current?.next = node.next
        }
    }

    return head
}