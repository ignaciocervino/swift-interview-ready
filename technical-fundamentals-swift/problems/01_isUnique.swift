// 1. *Is Unique*:

// Implement an algorithm to determine if a string has all unique characters.
// What if you cannot use additional data structures?

func isUnique(_ str: String) -> Bool {
    // Most simple solution
    // return Set(str).count == str.count

    // Naive solution O(n^2)
    for (i, letter) in str.enumerated() {
        let nextIndex = str.index(str.startIndex, offsetBy: i + 1)
        for letter2 in str[nextIndex..<str.endIndex] {
            if letter == letter2 {
                return false
            }
        }
    }
    return true
}

