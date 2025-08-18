// 6.  Suppose the digits are stored in forward order. Repeat the above problem.

// ```
// EXAMPLE
// Input: (6 -> 1 -> 7) + (2 -> 9 -> 5).Thatis,617 + 295
// Output:9 -> 1 -> 2,Thatis,912.
// ```

func sumListsForwardOrder(_ list1: Node<Int>?, _ list2: Node<Int>?) -> Node<Int>? {
    var sum1 = 0
    var sum2 = 0
    var multiplier = 1
    var total = 0

    list1?.forEach { node in 
        sum1 *= multiplier
        sum1 += node.value
        multiplier = 10
    }

    multiplier = 1

    list2?.forEach { node in
        sum2 *= multiplier
        sum2 += node.value
        multiplier = 10
    }

    total = sum1 + sum2
    var digit = total % 10
    var sumList = LinkedList<Int>()
    while total > 0 {
        sumList.push(digit)
        total = total / 10
        digit = total % 10
    }
    return sumList.head
}