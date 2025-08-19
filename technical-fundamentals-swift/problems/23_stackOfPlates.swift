// 3. *Stack of Plates*:

// Imagine a (literal) stack of plates. If the stack gets too high, it might topple.
// Therefore, in real life, we would likely start a new stack when the previous stack
// exceeds some threshold. Implement a data structure SetOfStacks that mimics this.
// SetOfStacks should be composed of several stacks and should create a new stack once
// the previous one exceeds capacity. SetOfStacks.push() and SetOfStacks.pop() should behave
// identically to a single stack (that is, pop() should return the same values as it would if
// there were just a single stack).

// FOLLOW UP: Implement a function popAt(int index) which performs a pop operation on a specific sub-stack.

// [1,2,3], [4,5,6], [3,4,5]

class SetOfStacks<T> {
    private var stacks: Array<Array<T?>>
    private let capacity: Int
    private var currentIndex = 0
    private var subStackPosition = 0
    
    init(capacity: Int) {
        self.capacity = capacity
        self.stacks = Array(arrayLiteral: Array(repeating: nil, count: capacity))
    }
    
    func push(_ value: T) {
        if subStackPosition < capacity {
            stacks[currentIndex][subStackPosition] = value
            subStackPosition += 1
        }

        if subStackPosition >= capacity {
            subStackPosition = 0
            currentIndex += 1
            if stacks.count < currentIndex + 1 {
                stacks.append(Array(repeating: nil, count: capacity))
            }
        }
    }
    
    func pop() -> T? {
        if subStackPosition <= 0 && currentIndex <= 0 {
            return nil
        } else if subStackPosition <= 0 {
            currentIndex -= 1
            subStackPosition = capacity
        }

        let position: Int = (subStackPosition == 0) ? 0 : subStackPosition - 1
        if let value = stacks[currentIndex][position] {
            stacks[currentIndex][position] = nil
            subStackPosition -= 1
            return value
        }

        return nil
    }

    func pop(at index: Int) -> T? {
        guard index <= currentIndex, index >= 0 else { return nil }
        return stacks[index].popLast()!
    }
}