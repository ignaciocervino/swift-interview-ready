// 8. *Zero Matrix*:

// Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.

func zeroMatrix(_ matrix: inout [[Int]]) {
    var zeroIndices = [(Int, Int)]()
    let M = matrix.count
    let N = matrix[0].count
    
    for i in 0 ..< M {
        for j in 0 ..< N {
            if matrix[i][j] == 0 {
                zeroIndices.append((i,j))
            }
        }
    }

    for i in 0 ..< M {
        for j in 0 ..< N {
            guard zeroIndices.contains(where: { $0.0 == i || $0.1 == j }) else { continue }
            matrix[i][j] = 0
        }
    }
}