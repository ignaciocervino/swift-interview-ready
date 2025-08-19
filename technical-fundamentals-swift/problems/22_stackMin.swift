// 2. *Stack Min*: How would you design a stack which,
// in addition to push and pop,
// has a function min which returns the minimum element?
// Push, pop, and min should all operate in O(1) time.
//

class StackMin<T: Comparable> {
    private var stack: [T]
    private var minimumAuxStack: [T]
    
    init() {
        self.stack = []
        self.minimumAuxStack = []
    }
    
    func push(_ value: T) {
        stack.append(value)

        if let min = minimumAuxStack.last {
            if value < min {
                minimumAuxStack.append(value)
            }
        } else {
            minimumAuxStack.append(value)
        }
    }
    
    func pop() -> T? {
        if let popedValue = stack.popLast() {
            if minimumAuxStack.last == popedValue {
                minimumAuxStack.removeLast()
            }
            return popedValue
        }

        return nil
    }
    
    func min() -> T? {
        minimumAuxStack.last
    }
}