// 6. *String Compression*:

// Implement a method to perform basic string compression using the counts of repeated characters.
// For example, the string aabcccccaaa would become a2blc5a3,
// If the "compressed" string would not become smaller than the original string,
// your method should return the original string.
// You can assume the string has only uppercase and lowercase letters (a - z).

func stringCompression(_ str: String) -> String {
    guard str.count > 0 else { return str }
    var compressed = ""
    var ocurrencies = 0
    var currentLetter = str.first!

    for letter in str {
        if letter == currentLetter {
            ocurrencies += 1
        } else {
            compressed += "\(currentLetter)\(ocurrencies)"
            currentLetter = letter
            ocurrencies = 1
        }
    }
    compressed += "\(currentLetter)\(ocurrencies)"
    return compressed.count < str.count ? compressed : str
}