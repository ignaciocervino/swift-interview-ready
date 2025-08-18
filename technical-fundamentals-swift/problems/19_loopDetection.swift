// 9. *Loop Detection*:

// Given a circular linked list, implement an algorithm that returns the node
// at the beginning of the loop.

// ```
// DEFINITION
// Circular linked list: A (corrupt) linked list in which a node's next pointer
// points to an earlier node, so as to make a loop in the linked list.
// ```

// ```
// EXAMPLE
// Input: A->8->C->D->E-> C[thesameCasearlier] Output: C
// Hints: #50, #69, #83, #90
// ```

func detectLoop<T: Equatable & Hashable>(_ head: Node<T>?) -> Node<T>? {
    var seen = Set<Node<T>>()
    var curr: Node<T>? = head
    
    while let node = curr {
        if !seen.insert(node).inserted {
            return node
        }
        curr = curr?.next
    }

    return nil
}