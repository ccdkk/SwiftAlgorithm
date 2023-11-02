//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/21.
//

import Foundation

func solution(_ board:[[Int]]) -> Int {

    var bombIndex: [(Int, Int)] = []
    for (idxX, x) in board.enumerated() {
        for (idxY, y) in x.enumerated() {
            if y == 1 {
                bombIndex.append((idxX, idxY))
            }
        }
    }
    
    var ans = Array(repeating: Array(repeating: true, count: board.count), count: board.count)
    
    bombIndex.forEach { (x, y) in
        let xRange = (max(0, x - 1)...(min(x + 1, board.count - 1)))
        let yRange = (max(0, y - 1)...(min(y + 1, board.count - 1)))
        for x in xRange {
            for y in yRange {
                ans[x][y] = false
            }
        }
    }
    
    return ans.flatMap { $0 }.filter { $0 }.count
}

print(solution([[1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]]))
