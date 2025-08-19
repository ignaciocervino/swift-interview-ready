// 6. *Animal Shelter*:

// An animal shelter, which holds only dogs and cats, operates on a strictly
// "first in, first out" basis. People must adopt either the "oldest"
// (based on arrival time) of all animals at the shelter,
// or they can select whether they would prefer a dog or a cat
// (and will receive the oldest animal of that type).
// They cannot select which specific animal they would like.
// Create the data structures to maintain this system and implement operations
// such as enqueue, dequeueAny, dequeueDog, and dequeueCat.
// You may use the built-in LinkedList data structure.

enum AnimalType: String, CaseIterable {
    case dog = "dog"
    case cat = "cat"
}

class Animal {
    let type: AnimalType
    let arrivalTime: Int
    
    init(type: AnimalType, arrivalTime: Int = 0) {
        self.type = type
        self.arrivalTime = arrivalTime
    }
}

class AnimalShelter {
    private var dogQueue = [Animal]()
    private var catQueue = [Animal]()
    private var count = 0
    
    init() {}
    
    func enqueue(type: AnimalType) {
        let animal = Animal(type: type, arrivalTime: count)
        count += 1
        switch type {
        case .dog:
            dogQueue.append(animal)
        case .cat:
            catQueue.append(animal)
        }
    }
    
    // O(n)
    func dequeueAny() -> Animal? {
        if dogQueue.first?.arrivalTime ?? Int.max < catQueue.first?.arrivalTime ?? Int.max {
            return !dogQueue.isEmpty ? dogQueue.removeFirst() : nil
        } else {
            return !catQueue.isEmpty ? catQueue.removeFirst() : nil
        }
    }
    
    func dequeueDog() -> Animal? {
        !dogQueue.isEmpty ? dogQueue.removeFirst() : nil
    }
    
    func dequeueCat() -> Animal? {
        !catQueue.isEmpty ? catQueue.removeFirst() : nil
    }
}