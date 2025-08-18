// 5. *Sum Lists*: You have two numbers represented by a linked list,
// where each node contains a single digit. The digits are stored in reverse order,
// such that the Vs digit is at the head of the list.
// Write a function that adds the two numbers and returns the sum as a linked list.

// ```
// EXAMPLE
// Input: (7-> 1 -> 6) + (5 -> 9 -> 2).That is,617 + 295.
// Output: 2 -> 1 -> 9. That is, 912.
// ```

func sumLists(_ list1: Node<Int>?, _ list2: Node<Int>?) -> Node<Int>? {
    var sum1 = 0
    var sum2 = 0
    var multiplier = 1
    var total = 0

    list1?.forEach { node in 
        sum1 += multiplier * node.value
        multiplier *= 10
    }

    multiplier = 1

    list2?.forEach { node in
        sum2 += multiplier * node.value
        multiplier *= 10
    }

    total = sum1 + sum2
    var digit = total % 10
    var sumList = LinkedList<Int>()
    while total > 0 {
        sumList.append(value: digit)
        total = total / 10
        digit = total % 10
    }
    return sumList.head
}