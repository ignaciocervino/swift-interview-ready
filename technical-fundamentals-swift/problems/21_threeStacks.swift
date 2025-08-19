// 1. *Three in One*: Describe how you could use a single array to implement three stacks.

class ThreeStacks<T> {
    private var stack: [T?]
    private let stackLength: Int
    
    init(arrayLength: Int) {
        self.stack = Array(repeating: nil, count: arrayLength)
        self.stackLength = arrayLength/3
    }
    
    func push(stackNum: Int, value: T) {
        let length = (stackNum + 1) * stackLength
        let startingIndex = length - stackLength
        for i in (startingIndex...length-1).reversed() {
            if stack[i] == nil {
                stack[i] = value
                return
            }
        }
    }
    
    func pop(stackNum: Int) -> T? {
        let length = (stackNum + 1) * stackLength
        let startingIndex = length - stackLength
        for i in startingIndex...length-1 {
            if stack[i] != nil {
                let value = stack[i]
                stack[i] = nil
                return value!
            }
        }
        return nil
    }
    
    func peek(stackNum: Int) -> T? {
        let length = (stackNum + 1) * stackLength
        let startingIndex = length - stackLength
        for i in startingIndex...length-1 {
            if stack[i] != nil {
                return stack[i]!
            }
        }
        return nil
    }
}