// 2.  *Return Kth to Last*:

// Implement an algorithm to find the kth to last element of a singly linked list.

func kthToLast<T: Equatable>(_ head: Node<T>?, _ k: Int) -> Node<T>? {
    guard k > 0 else { return nil }
    let ret: Node<T>?
    var curr: Node<T>? = head
    var count = 0

    while curr != nil {
        count += 1
        curr = curr?.next
    }

    let element = count + 1 - k
    count = 1
    curr = head
    while curr != nil {
        if count == element {
            ret = curr
            return ret
        }

        curr = curr?.next
        count += 1
    }


    return nil
}