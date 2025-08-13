import XCTest
@testable import TechnicalFundamentalsSwift

final class IntersectionTests: XCTestCase {
    
    func testReturnsNilIfListsDontIntersect() {
        let list1 = createGenericList([1, 2, 3])
        let list2 = createGenericList([4, 5, 6])
        let result = intersection(list1, list2)
        XCTAssertNil(result, "Should return nil if lists don't intersect")
    }
    
    func testReturnsIntersectionNodeWhenListsIntersect() {
        // Create shared tail: 7->8->9
        let sharedTail = createGenericList([7, 8, 9])
        
        // Create first list: 1->2->3->shared
        let list1 = Node(1)
        list1.next = Node(2)
        list1.next?.next = Node(3)
        list1.next?.next?.next = sharedTail
        
        // Create second list: 4->5->shared  
        let list2 = Node(4)
        list2.next = Node(5)
        list2.next?.next = sharedTail
        
        let result = intersection(list1, list2)
        XCTAssertTrue(result === sharedTail, "Should return the shared node by reference")
        XCTAssertEqual(result?.value, 7, "Intersection should be at node with value 7")
    }
    
    func testHandlesIntersectionAtHead() {
        // Both lists start with the same node
        let sharedHead = createGenericList([1, 2, 3])
        
        let result = intersection(sharedHead, sharedHead)
        XCTAssertTrue(result === sharedHead, "Should return head when lists are identical")
        XCTAssertEqual(result?.value, 1, "Should return first node")
    }
    
    func testHandlesIntersectionAtEnd() {
        // Create shared last node
        let sharedEnd = Node(9)
        
        // Create first list: 1->2->3->shared
        let list1 = Node(1)
        list1.next = Node(2)
        list1.next?.next = Node(3)
        list1.next?.next?.next = sharedEnd
        
        // Create second list: 4->5->6->7->shared
        let list2 = Node(4)
        list2.next = Node(5)
        list2.next?.next = Node(6)
        list2.next?.next?.next = Node(7)
        list2.next?.next?.next?.next = sharedEnd
        
        let result = intersection(list1, list2)
        XCTAssertTrue(result === sharedEnd, "Should find intersection at end")
        XCTAssertEqual(result?.value, 9, "Should return the shared end node")
    }
    
    func testHandlesEmptyLists() {
        let list1 = createGenericList([1, 2, 3])
        
        let result1 = intersection(list1, nil)
        XCTAssertNil(result1, "Should return nil when one list is empty")
        
        let result2 = intersection(nil, list1)
        XCTAssertNil(result2, "Should return nil when one list is empty")
        
        let result3 = intersection(nil as Node<Int>?, nil as Node<Int>?)
        XCTAssertNil(result3, "Should return nil when both lists are empty")
    }
    
    func testIntersectionWithDifferentLengths() {
        // Create shared portion: 10->11
        let shared = Node(10)
        shared.next = Node(11)
        
        // Short list: shared
        let shortList = shared
        
        // Long list: 1->2->3->4->5->shared
        let longList = Node(1)
        longList.next = Node(2)
        longList.next?.next = Node(3)
        longList.next?.next?.next = Node(4)
        longList.next?.next?.next?.next = Node(5)
        longList.next?.next?.next?.next?.next = shared
        
        let result = intersection(shortList, longList)
        XCTAssertTrue(result === shared, "Should find intersection despite different lengths")
        XCTAssertEqual(result?.value, 10, "Should return correct intersection node")
    }
}