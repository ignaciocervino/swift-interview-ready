// 5. *One Away*:

// There are three types of edits that can be performed on strings:
// insert a character, remove a character, or replace a character.
// Given two strings, write a function to check if they are one edit (or zero edits) away.

func isOneAway(_ str1: String, _ str2: String) -> Bool {
    var editCount = 0
    var index1 = 0
    var index2 = 0

    while index1 < str1.count || index2 < str2.count {
        guard editCount <= 1 else { return false }
        guard index1 < str1.count, index2 < str2.count else { 
            index1 += 1
            index2 += 1
            editCount += 1
            continue
        }
        let char1 = str1[str1.index(str1.startIndex, offsetBy: index1)]
        let char2 = str2[str2.index(str2.startIndex, offsetBy: index2)]

        if char1 != char2 {
            editCount += 1
            if str1.count > str2.count {
                index1 += 1
                continue
            } else if str1.count < str2.count {
                index2 += 1
                continue
            }
        }

        index1 += 1
        index2 += 1
    }

    return editCount <= 1
}