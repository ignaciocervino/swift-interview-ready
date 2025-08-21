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
    // TODO: Implement build order algorithm
    return .error("Not implemented")
}