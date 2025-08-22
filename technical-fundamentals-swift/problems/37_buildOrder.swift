// 7. *Build Order*:

// You are given a list of projects and a list of dependencies
// (which is a list of pairs of projects, where the second project is
// dependent on the first project). All of a project's dependencies
// must be built before the project is. Find a build order that will allow
// the projects to be built. If there is no valid build order, return an error.

// ```
// EXAMPLE Input:
// projects: a, b, c, d, e, f
// dependencies: (a, d), (f, b), (b, d), (f, a), (d, c)
// Output: e, f, a, b, d, c
// ```

public enum BuildOrderResult {
    case success([String])
    case error(String)
}

public func buildOrder(projects: [String], dependencies: [[String]]) -> BuildOrderResult {
    var nodes = Dictionary<String, GraphNode<String>>()
    var nodeCount = Dictionary<String, Int>()
    var buildOrder = [String]()

    for project in projects {
        if nodes[project] == nil {
            nodes[project] = GraphNode(value: project)
            nodeCount[project] = 0 
        } else {
            return .error("No valid build order")
        }
    }

    for dependency in dependencies {
        if let node = nodes[dependency[0]], let child = nodes[dependency[1]] {
            nodeCount[dependency[1], default: 0] += 1 
            node.neighbors.append(child)
        } else {
            return .error("No valid build order")
        }
    }

    let rootNodes = projects.filter { nodeCount[$0] == 0 }

    bfs(nodes: rootNodes, nodeCount: &nodeCount, graph: nodes, buildOrder: &buildOrder)
    if buildOrder.count != projects.count {
        return .error("No valid build order")
    } else {
        return .success(buildOrder)
    }
}

func bfs(nodes: [String], nodeCount: inout [String: Int], graph: [String: GraphNode<String>], buildOrder: inout [String]){
    var queue = nodes

    while !queue.isEmpty {
        let dequeueValue = queue.removeFirst()
        buildOrder.append(dequeueValue)
        for neighbor in graph[dequeueValue]!.neighbors {
            nodeCount[neighbor.value]! -= 1
            
            if nodeCount[neighbor.value] == 0 {
                queue.append(neighbor.value)
            }
        }
    }
}