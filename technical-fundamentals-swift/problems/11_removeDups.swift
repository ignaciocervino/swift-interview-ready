// 1. *Remove Dups*:

// Write code to remove duplicates from an unsorted linked list. FOLLOW UP
// How would you solve this problem if a temporary buffer is not allowed?
//
// 1 -> 2 -> 2-> 2 -> 4

func removeDups<T: Equatable>(_ head: Node<T>?) -> Node<T>? {
    guard head != nil else { return head }
    var occurrences = Set<T>()
    var node = head
    let ret = Node(head!.value)
    var curr: Node<T>? = ret
    occurrences.insert(head!.value)
    
    while node != nil {
        if !occurrences.contains(node!.value) {
            curr?.next = Node(node!.value)
            occurrences.insert(node!.value)
            curr = curr?.next
        }
        
        node = node?.next
    }

    return ret
}