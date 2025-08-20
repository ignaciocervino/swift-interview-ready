// 1. *Three in One*: Describe how you could use a single array to implement three stacks.

class ThreeStacks<T> {
    private var array: [T?]
    private var sizes: [Int]
    
    init(arrayLength: Int) {
        self.array = Array(repeating: nil, count: arrayLength)
        self.sizes = [0, 0, 0]
    }
    
    func push(stackNum: Int, value: T) {
        // TODO: Implement push logic
    }
    
    func pop(stackNum: Int) -> T? {
        // TODO: Implement pop logic
        return nil
    }
    
    func peek(stackNum: Int) -> T? {
        // TODO: Implement peek logic
        return nil
    }
}