import XCTest
@testable import TechnicalFundamentalsSwift

final class BuildOrderTests: XCTestCase {
    
    func testBuildOrderWithValidDependencies() {
        let projects = ["a", "b", "c", "d", "e", "f"]
        let dependencies = [["a", "d"], ["f", "b"], ["b", "d"], ["f", "a"], ["d", "c"]]
        
        let result = buildOrder(projects: projects, dependencies: dependencies)
        
        switch result {
        case .success(let order):
            XCTAssertEqual(order.count, 6)
            // Validate that dependencies are respected
            let fIndex = order.firstIndex(of: "f")!
            let aIndex = order.firstIndex(of: "a")!
            let bIndex = order.firstIndex(of: "b")!
            let dIndex = order.firstIndex(of: "d")!
            let cIndex = order.firstIndex(of: "c")!
            
            XCTAssertLessThan(fIndex, bIndex) // f before b
            XCTAssertLessThan(fIndex, aIndex) // f before a
            XCTAssertLessThan(aIndex, dIndex) // a before d
            XCTAssertLessThan(bIndex, dIndex) // b before d
            XCTAssertLessThan(dIndex, cIndex) // d before c
        case .error:
            XCTFail("Expected valid build order")
        }
    }
    
    func testBuildOrderWithCyclicDependency() {
        let projects = ["a", "b", "c"]
        let dependencies = [["a", "b"], ["b", "c"], ["c", "a"]] // Circular dependency
        
        let result = buildOrder(projects: projects, dependencies: dependencies)
        
        switch result {
        case .success:
            XCTFail("Expected error due to circular dependency")
        case .error(let message):
            XCTAssertFalse(message.isEmpty)
        }
    }
    
    func testBuildOrderWithNoDependencies() {
        let projects = ["a", "b", "c"]
        let dependencies: [[String]] = []
        
        let result = buildOrder(projects: projects, dependencies: dependencies)
        
        switch result {
        case .success(let order):
            XCTAssertEqual(order.count, 3)
            XCTAssertTrue(order.contains("a"))
            XCTAssertTrue(order.contains("b"))
            XCTAssertTrue(order.contains("c"))
        case .error:
            XCTFail("Expected valid build order with no dependencies")
        }
    }
    
    func testBuildOrderWithSelfDependency() {
        let projects = ["a", "b"]
        let dependencies = [["a", "a"]] // Self dependency
        
        let result = buildOrder(projects: projects, dependencies: dependencies)
        
        switch result {
        case .success:
            XCTFail("Expected error due to self dependency")
        case .error(let message):
            XCTAssertFalse(message.isEmpty)
        }
    }
    
    func testBuildOrderWithComplexValidDependencies() {
        let projects = ["a", "b", "c", "d", "e"]
        let dependencies = [["a", "b"], ["a", "c"], ["b", "d"], ["c", "d"], ["d", "e"]]
        
        let result = buildOrder(projects: projects, dependencies: dependencies)
        
        switch result {
        case .success(let order):
            XCTAssertEqual(order.count, 5)
            
            let aIndex = order.firstIndex(of: "a")!
            let bIndex = order.firstIndex(of: "b")!
            let cIndex = order.firstIndex(of: "c")!
            let dIndex = order.firstIndex(of: "d")!
            let eIndex = order.firstIndex(of: "e")!
            
            XCTAssertLessThan(aIndex, bIndex) // a before b
            XCTAssertLessThan(aIndex, cIndex) // a before c
            XCTAssertLessThan(bIndex, dIndex) // b before d
            XCTAssertLessThan(cIndex, dIndex) // c before d
            XCTAssertLessThan(dIndex, eIndex) // d before e
        case .error:
            XCTFail("Expected valid build order")
        }
    }
    
    func testBuildOrderWithEmptyProjects() {
        let projects: [String] = []
        let dependencies: [[String]] = []
        
        let result = buildOrder(projects: projects, dependencies: dependencies)
        
        switch result {
        case .success(let order):
            XCTAssertEqual(order.count, 0)
        case .error:
            XCTFail("Expected valid build order for empty projects")
        }
    }
}