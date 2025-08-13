// 2. *Check Permutation*:

// Given two strings, write a method to decide if one is a permutation of the other.

func checkPermutations(_ s1: String, _ s2: String) -> Bool {
    var ocurrencies = [Character: Int]()

    for letter in s1 {
        ocurrencies[letter, default: 0] += 1
    }

    for letter in s2 {
        guard ocurrencies[letter] != nil else { return false }
        ocurrencies[letter]! -= 1
    }

    return ocurrencies.values.reduce(0, +) == 0
}