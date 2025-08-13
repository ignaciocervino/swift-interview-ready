// 9. *String Rotation*;

// Assume you have a method isSubstring which checks if one word is a substring of another.
// Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring.
// [e.g., "waterbottle" is a rotation of 'erbottlewat")

func isSubstring(_ str: String, _ sub: String) -> Bool {
    return str.contains(sub)
}

func stringRotation(_ s1: String, _ s2: String) -> Bool {
    guard s1.count == s2.count else { return false }
    var s2Rotated = ""
    for i in 0 ..< s1.count {
        guard s1 != s2Rotated else {
            return true
        }
        let currentIndex = s2.index(s2.startIndex, offsetBy: i + 1)
        s2Rotated = String(s2[currentIndex..<s2.endIndex] + s2[s2.startIndex..<currentIndex])
    }

    return s1 == s2Rotated
}