// 1. *Route Between Nodes*:

// Given a directed graph, design an algorithm to find out whether there is a route
// between two nodes.

public class GraphNode<T: Equatable & Hashable>: Hashable, Equatable {
    public var value: T
    public var neighbors: [GraphNode<T>]
    
    public init(value: T) {
        self.value = value
        self.neighbors = []
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    public static func == (lhs: GraphNode<T>, rhs: GraphNode<T>) -> Bool {
        lhs === rhs
    }
}

public func hasRouteBetweenNodes<T: Equatable & Hashable>(start: GraphNode<T>, end: GraphNode<T>) -> Bool {
    var visited: Set<GraphNode<T>> = []
    return dfs(start, end, &visited)
}

public func dfs<T: Equatable & Hashable>(_ node: GraphNode<T>, _ target: GraphNode<T>, _ visited: inout Set<GraphNode<T>>) -> Bool {
    if node === target { return true }
    visited.insert(node)
    for neighbor in node.neighbors {
        if !visited.contains(neighbor) {
            if dfs(neighbor, target, &visited) { return true }
        }
    }

    return false
}