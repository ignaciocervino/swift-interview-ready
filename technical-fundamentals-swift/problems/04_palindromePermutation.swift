// 4. *Palindrome Permutation*: 

// Given a string, write a function to check if it is a permutation of a palindrome.
// A palindrome is a word or phrase that is the same forwards and backwards. A permutation is a rearrangement of letters.
// The palindrome does not need to be limited to just dictionary words.
// ```
// EXAMPLE
// Input: Tact Coa
// Output True (permutations: "taco cat", "atco cta", etc.)
// ```

import Foundation
//Tact Coa
func palindromePermutation(_ str: String) -> Bool {
    let ignoreWhitespaces = str.lowercased().replacingOccurrences(of: " ", with: "")
    let ocurrencies = ignoreWhitespaces.reduce(into: [Character: Int]()) { dict, letter in 
        dict[letter, default: 0] += 1
    }
    var oddFlag = false

    for ocurrence in ocurrencies.values {
        if !ocurrence.isMultiple(of: 2) {
            guard !oddFlag else { return false }
            oddFlag = true
        }
    }

    return true
}