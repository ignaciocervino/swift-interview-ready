// 10. *Implement a Linked List*;

public class LinkedList<T: Equatable & Hashable> {
    public var head: Node<T>?
    public var tail: Node<T>?

    init(head: Node<T>? = nil) {
        self.head = head
    }

    public var isEmpty: Bool {
        head == nil
    }
}

public class Node<T: Equatable & Hashable> {
    public var value: T
    public var next: Node<T>?
    
    public init(value: T, _ next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }

    public var count: Int {
        var _count = 0
        self.forEach { _ in _count += 1 }
        return _count
    }

    public func forEach(_ visit:(Node<T>) -> Void) {
        var curr: Node? = self
        while curr != nil {
            visit(curr!)
            curr = curr?.next
        }
    }
}

// Helper functions for creating and working with linked lists
public func createList(_ values: [Int]) -> Node<Int>? {
    guard !values.isEmpty else { return nil }
    
    let head = Node(value: values[0])
    var current = head
    
    for i in 1..<values.count {
        current.next = Node(value: values[i])
        current = current.next!
    }
    
    return head
}

public func createGenericList<T: Equatable & Hashable>(_ values: [T]) -> Node<T>? {
    guard !values.isEmpty else { return nil }
    
    let head = Node(value: values[0])
    var current = head
    
    for i in 1..<values.count {
        current.next = Node(value: values[i])
        current = current.next!
    }
    
    return head
}

public func listToArray(_ head: Node<Int>?) -> [Int] {
    var result: [Int] = []
    var current = head
    
    while let node = current {
        result.append(node.value)
        current = node.next
    }
    
    return result
}

public func genericListToArray<T: Equatable & Hashable>(_ head: Node<T>?) -> [T] {
    var result: [T] = []
    var current = head
    
    while let node = current {
        result.append(node.value)
        current = node.next
    }
    
    return result
}