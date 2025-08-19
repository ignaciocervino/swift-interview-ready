// 4. *Queue via Stacks*:

// Implement a MyQueue class which implements a queue using two stacks.

// MARK: - Second attempt understanding we should have a stack for pushes and other for pops
class MyQueue<T> {
    private var inStack = [T]()
    private var outStack = [T]()
    
    init() {

    }
    
    func enqueue(_ value: T) {
        inStack.append(value)
    }
    
    func dequeue() -> T? {
        var aux = [T]()
        if outStack.isEmpty {
            while !inStack.isEmpty {
                aux.append(inStack.popLast()!)
            }

            for element in aux {
                outStack.append(element)
            }

            return outStack.popLast()
        }

        return outStack.popLast()
    }
    
    func peek() -> T? {
        if !outStack.isEmpty {
            return outStack.last
        }
        return inStack.first
    }
    
    func isEmpty() -> Bool {
        inStack.isEmpty && outStack.isEmpty
    }
}

// MARK: - My first attempt
// class MyQueue<T> {
//     private var peekStack = [T]()
//     private var mainStack = [T]()
    
//     init() {

//     }
    
//     func enqueue(_ value: T) {
//         var aux = [T]()
//         if peekStack.isEmpty {
//             peekStack.append(value)
//         } else {
//             while !mainStack.isEmpty {
//                 aux.append(mainStack.popLast()!)
//             }
//             mainStack.append(value)
//             for element in aux {
//                 mainStack.append(element)
//             }
//         }
//     }
    
//     func dequeue() -> T? {
//         var ret: T?
//         if !peekStack.isEmpty {
//             ret = peekStack.popLast()
//             if !mainStack.isEmpty {
//                 peekStack.append(mainStack.popLast()!)
//             }
//         }
//         return ret
//     }
    
//     func peek() -> T? {
//         peekStack.last
//     }
    
//     func isEmpty() -> Bool {
//         peekStack.isEmpty
//     }
// }