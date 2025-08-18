// 7. *Palindrome*:

// Implement a function to check if a linked list is a palindrome.

func isPalindrome<T: Equatable & Hashable>(_ head: Node<T>?) -> Bool {
    var array = Array<T>()

    head?.forEach { node in 
        array.append(node.value)
    }

    return array == array.reversed()
}