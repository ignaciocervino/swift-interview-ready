import XCTest
@testable import TechnicalFundamentalsSwift

final class PalindromeTests: XCTestCase {
    
    func testSingleNodeIsPalindrome() {
        let head = createGenericList([1])
        let result = isPalindrome(head)
        XCTAssertTrue(result, "Single node should be a palindrome")
    }
    
    func testOddNumberOfNodesPalindrome() {
        let head = createGenericList([1, 2, 3, 2, 1])
        let result = isPalindrome(head)
        XCTAssertTrue(result, "1->2->3->2->1 should be a palindrome")
    }
    
    func testEvenNumberOfNodesPalindrome() {
        let head = createGenericList([1, 2, 2, 1])
        let result = isPalindrome(head)
        XCTAssertTrue(result, "1->2->2->1 should be a palindrome")
    }
    
    func testNonPalindromeList() {
        let head = createGenericList([1, 2, 3, 4, 5])
        let result = isPalindrome(head)
        XCTAssertFalse(result, "1->2->3->4->5 should not be a palindrome")
    }
    
    func testTwoNodesPalindrome() {
        let head = createGenericList([1, 1])
        let result = isPalindrome(head)
        XCTAssertTrue(result, "1->1 should be a palindrome")
    }
    
    func testTwoNodesNonPalindrome() {
        let head = createGenericList([1, 2])
        let result = isPalindrome(head)
        XCTAssertFalse(result, "1->2 should not be a palindrome")
    }
    
    func testEmptyListIsPalindrome() {
        let result = isPalindrome(nil as Node<Int>?)
        XCTAssertTrue(result, "Empty list should be considered a palindrome")
    }
    
    func testStringPalindrome() {
        let head = createGenericList(["a", "b", "c", "b", "a"])
        let result = isPalindrome(head)
        XCTAssertTrue(result, "String palindrome should work")
    }
    
    func testStringNonPalindrome() {
        let head = createGenericList(["a", "b", "c", "d"])
        let result = isPalindrome(head)
        XCTAssertFalse(result, "String non-palindrome should work")
    }
    
    func testLongerPalindrome() {
        let head = createGenericList([1, 2, 3, 4, 5, 4, 3, 2, 1])
        let result = isPalindrome(head)
        XCTAssertTrue(result, "Longer palindrome should work")
    }
}