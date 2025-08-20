import XCTest
@testable import TechnicalFundamentalsSwift

final class AnimalShelterTests: XCTestCase {
    
    func testEnqueueDequeueWithFIFOBehavior() {
        let shelter = AnimalShelter()
        
        shelter.enqueue(type: .dog)
        shelter.enqueue(type: .cat)
        shelter.enqueue(type: .dog)
        shelter.enqueue(type: .cat)
        
        // Should return oldest animal (first dog)
        let firstAnimal = shelter.dequeueAny()
        XCTAssertNotNil(firstAnimal, "Should return an animal")
        XCTAssertEqual(firstAnimal?.type, .dog, "First animal should be a dog")
        
        // Should return second oldest animal (first cat)
        let secondAnimal = shelter.dequeueAny()
        XCTAssertNotNil(secondAnimal, "Should return an animal")
        XCTAssertEqual(secondAnimal?.type, .cat, "Second animal should be a cat")
    }
    
    func testSpecificDogDequeueOperations() {
        let shelter = AnimalShelter()
        
        shelter.enqueue(type: .cat)
        shelter.enqueue(type: .dog)
        shelter.enqueue(type: .cat)
        shelter.enqueue(type: .dog)
        
        // Should return oldest dog
        let firstDog = shelter.dequeueDog()
        XCTAssertNotNil(firstDog, "Should return a dog")
        XCTAssertEqual(firstDog?.type, .dog, "Should be a dog")
        
        // Should return next oldest dog
        let secondDog = shelter.dequeueDog()
        XCTAssertNotNil(secondDog, "Should return a dog")
        XCTAssertEqual(secondDog?.type, .dog, "Should be a dog")
        
        // No more dogs left
        let noDog = shelter.dequeueDog()
        XCTAssertNil(noDog, "Should return nil when no dogs left")
    }
    
    func testSpecificCatDequeueOperations() {
        let shelter = AnimalShelter()
        
        shelter.enqueue(type: .dog)
        shelter.enqueue(type: .cat)
        shelter.enqueue(type: .dog)
        shelter.enqueue(type: .cat)
        
        // Should return oldest cat
        let firstCat = shelter.dequeueCat()
        XCTAssertNotNil(firstCat, "Should return a cat")
        XCTAssertEqual(firstCat?.type, .cat, "Should be a cat")
        
        // Should return next oldest cat
        let secondCat = shelter.dequeueCat()
        XCTAssertNotNil(secondCat, "Should return a cat")
        XCTAssertEqual(secondCat?.type, .cat, "Should be a cat")
        
        // No more cats left
        let noCat = shelter.dequeueCat()
        XCTAssertNil(noCat, "Should return nil when no cats left")
    }
    
    func testAllDequeueMethodsReturnNilWhenEmpty() {
        let shelter = AnimalShelter()
        
        XCTAssertNil(shelter.dequeueAny(), "dequeueAny should return nil when empty")
        XCTAssertNil(shelter.dequeueDog(), "dequeueDog should return nil when empty")
        XCTAssertNil(shelter.dequeueCat(), "dequeueCat should return nil when empty")
    }
    
    func testMixedDequeueOperations() {
        let shelter = AnimalShelter()
        
        shelter.enqueue(type: .dog)   // Dog 1 (oldest)
        shelter.enqueue(type: .cat)   // Cat 1
        shelter.enqueue(type: .dog)   // Dog 2
        shelter.enqueue(type: .cat)   // Cat 2 (newest)
        
        // Get oldest dog specifically
        let dog = shelter.dequeueDog()
        XCTAssertEqual(dog?.type, .dog, "Should get a dog")
        
        // Get oldest remaining animal (should be Cat 1)
        let anyAnimal = shelter.dequeueAny()
        XCTAssertEqual(anyAnimal?.type, .cat, "Should get the oldest remaining animal (cat)")
        
        // Get oldest cat specifically (should be Cat 2)
        let cat = shelter.dequeueCat()
        XCTAssertEqual(cat?.type, .cat, "Should get remaining cat")
        
        // Only Dog 2 should be left
        let lastAnimal = shelter.dequeueAny()
        XCTAssertEqual(lastAnimal?.type, .dog, "Should get last remaining dog")
        
        // Should be empty now
        XCTAssertNil(shelter.dequeueAny(), "Should be empty")
    }
    
    func testOnlyDogsInShelter() {
        let shelter = AnimalShelter()
        
        shelter.enqueue(type: .dog)
        shelter.enqueue(type: .dog)
        shelter.enqueue(type: .dog)
        
        XCTAssertNil(shelter.dequeueCat(), "Should return nil when no cats")
        
        let dog1 = shelter.dequeueDog()
        let dog2 = shelter.dequeueAny()
        let dog3 = shelter.dequeueDog()
        
        XCTAssertEqual(dog1?.type, .dog, "Should get dog")
        XCTAssertEqual(dog2?.type, .dog, "Should get dog")
        XCTAssertEqual(dog3?.type, .dog, "Should get dog")
        
        XCTAssertNil(shelter.dequeueAny(), "Should be empty")
    }
    
    func testOnlyCatsInShelter() {
        let shelter = AnimalShelter()
        
        shelter.enqueue(type: .cat)
        shelter.enqueue(type: .cat)
        shelter.enqueue(type: .cat)
        
        XCTAssertNil(shelter.dequeueDog(), "Should return nil when no dogs")
        
        let cat1 = shelter.dequeueCat()
        let cat2 = shelter.dequeueAny()
        let cat3 = shelter.dequeueCat()
        
        XCTAssertEqual(cat1?.type, .cat, "Should get cat")
        XCTAssertEqual(cat2?.type, .cat, "Should get cat")
        XCTAssertEqual(cat3?.type, .cat, "Should get cat")
        
        XCTAssertNil(shelter.dequeueAny(), "Should be empty")
    }
}