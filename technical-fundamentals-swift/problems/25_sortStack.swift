// 5. *Sort Stack*:

// Write a program to sort a stack such that the smallest items are on the top.
// You can use an additional temporary stack, but you may not copy the elements
// into any other data structure (such as an array).
// The stack supports the following operations: push, pop, peek, and isEmpty.

class SortStack<T: Comparable> {
    private var stack = [T]()
    private var auxStack = [T]()

    init() {}
    
    func push(_ value: T) {
        while !stack.isEmpty {
            if let peek = stack.last, value > peek {
                auxStack.append(stack.popLast()!)
            } else {
                break
            }
        }

        stack.append(value)

        while !auxStack.isEmpty {
            stack.append(auxStack.popLast()!)
        }
    }
    
    func pop() -> T? {
        stack.popLast()
    }
    
    func peek() -> T? {
        stack.last
    }
    
    func isEmpty() -> Bool {
        stack.isEmpty
    }
}