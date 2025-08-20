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
    
    init() {
        // TODO: Implement animal shelter
    }
    
    func enqueue(type: AnimalType) {
        // TODO: Implement enqueue functionality
    }
    
    func dequeueAny() -> Animal? {
        // TODO: Implement dequeue any animal functionality
        return nil
    }
    
    func dequeueDog() -> Animal? {
        // TODO: Implement dequeue dog functionality
        return nil
    }
    
    func dequeueCat() -> Animal? {
        // TODO: Implement dequeue cat functionality
        return nil
    }
}