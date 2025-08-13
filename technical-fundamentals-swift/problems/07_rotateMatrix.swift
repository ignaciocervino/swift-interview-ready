// 7. *Rotate Matrix*:

// Given an image represented by an NxN matrix, where each pixel in the image is 4
// bytes, write a method to rotate the image by 90 degrees. Can you do this in place?

struct Coordinates: Hashable {
    let i: Int
    let j: Int
}
func rotateMatrix(_ matrix: inout [[Int]]) {
    var visited = [Coordinates: Bool]()
    let N = matrix.count 
    for i in 0 ..< N {
        for j in 0 ..< N {
            guard visited[Coordinates(i: i, j: j)] == nil else { continue }
            
            if i != j {
                visited[Coordinates(i: i, j: j)] = true
                visited[Coordinates(i: j, j: i)] = true
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
    }

    for i in 0 ..< N {
        matrix[i].reverse()
    }
}