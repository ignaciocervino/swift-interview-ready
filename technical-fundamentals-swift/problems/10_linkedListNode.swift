// 10. *Implement a Linked List*;

// Create the data structure with the corresponding initial functions:

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// Generic Node class for problems that need different types
public class Node<T: Equatable & Hashable> {
    public var value: T
    public var next: Node<T>?
    
    public init(_ value: T) {
        self.value = value
        self.next = nil
    }
    
    public init(_ value: T, _ next: Node<T>?) {
        self.value = value
        self.next = next
    }
}

// Helper functions for creating and working with linked lists
public func createList(_ values: [Int]) -> ListNode? {
    guard !values.isEmpty else { return nil }
    
    let head = ListNode(values[0])
    var current = head
    
    for i in 1..<values.count {
        current.next = ListNode(values[i])
        current = current.next!
    }
    
    return head
}

public func createGenericList<T: Equatable>(_ values: [T]) -> Node<T>? {
    guard !values.isEmpty else { return nil }
    
    let head = Node(values[0])
    var current = head
    
    for i in 1..<values.count {
        current.next = Node(values[i])
        current = current.next!
    }
    
    return head
}

public func listToArray(_ head: ListNode?) -> [Int] {
    var result: [Int] = []
    var current = head
    
    while let node = current {
        result.append(node.val)
        current = node.next
    }
    
    return result
}

public func genericListToArray<T: Equatable>(_ head: Node<T>?) -> [T] {
    var result: [T] = []
    var current = head
    
    while let node = current {
        result.append(node.value)
        current = node.next
    }
    
    return result
}