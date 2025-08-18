// 10. *Implement a Linked List*;

public struct LinkedList<T: Equatable & Hashable> {
    public var head: Node<T>?
    public var tail: Node<T>?

    init(head: Node<T>? = nil) {
        self.head = head
    }

    public var isEmpty: Bool {
        head == nil
    }

    public mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    public mutating func append(value: T) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }

    public mutating func concat(_ list: LinkedList<T>?) {
        guard !isEmpty else {
            head = list?.head
            tail = list?.tail
            return
        }

        tail?.next = list?.head
        tail = list?.tail
    }
}

public class Node<T: Equatable & Hashable> {
    public var value: T
    public var next: Node<T>?
    
    public init(value: T, next: Node<T>? = nil) {
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

    public func remove(at position: Int) -> Node<T>? {
        var curr: Node<T>? = self
        var count = 1
        self.forEach { node in 
            if position - 1 == count {
                curr?.next = curr?.next?.next
            }
            
            curr = curr?.next
            count += 1
        }

        return self
    }

    public func push(value: T) -> Node<T>? {
        return Node(value: value, next: self)
    }

    public func concat(_ node: Node<T>?) {
        var curr: Node<T>? = self

        self.forEach { node in 
            curr = node
        }

        curr?.next = node        
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