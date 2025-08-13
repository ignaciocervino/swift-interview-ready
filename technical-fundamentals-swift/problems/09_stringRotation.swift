// 9. *String Rotation*;

// Assume you have a method isSubstring which checks if one word is a substring of another.
// Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring.
// [e.g., "waterbottle" is a rotation of 'erbottlewat")

func isSubstring(_ str: String, _ sub: String) -> Bool {
    return str.contains(sub)
}

func stringRotation(_ s1: String, _ s2: String) -> Bool {
    return false
}