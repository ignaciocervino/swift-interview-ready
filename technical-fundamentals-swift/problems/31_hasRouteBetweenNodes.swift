// Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route between two nodes.

public class GraphNode<T: Equatable & Hashable> {
    public var value: T
    public var neighbors: [GraphNode<T>]
    
    public init(value: T) {
        self.value = value
        self.neighbors = []
    }
}

public func hasRouteBetweenNodes<T: Equatable & Hashable>(start: GraphNode<T>, end: GraphNode<T>) -> Bool {
    // TODO: Implement route finding algorithm
    return false
}