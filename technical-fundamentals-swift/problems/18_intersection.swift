// 8.  *Intersection*;

// Given two (singly) linked lists, determine if the two lists intersect.
// Return the first intersecting node. Note that the intersection is defined
// based on reference, not value.

func intersection<T: Equatable & Hashable>(_ list1: Node<T>?, _ list2: Node<T>?) -> Node<T>? {
    var nodes = Set<Node<T>>()
    var result: Node<T>? = nil

    list1?.forEach { node in 
        nodes.insert(node)
    }

    list2?.forEach { node in 
        if nodes.contains(node) && result == nil {
            result = node
        }
    }

    return result
}