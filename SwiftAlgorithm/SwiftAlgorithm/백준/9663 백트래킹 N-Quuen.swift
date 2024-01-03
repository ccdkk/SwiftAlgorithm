//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 12/30/23.
//

import Foundation

// 9663 N-Queen

let N = Int(readLine()!)!

var isUsedColumn = [Bool](repeating: false, count: N)
var isUsedDiagonalLineUp = [Bool](repeating: false, count: 2 * N - 1)
var isUsedDiagonalLineDown = [Bool](repeating: false, count: 2 * N - 1)
var ans = 0

func nQueenRecursion(row: Int) {
    if row == N {
        ans += 1
        return
    }
    
    // 첫번째 퀸의 시작열
    for i in 0..<N {
        if !isUsedColumn[i] && !isUsedDiagonalLineUp[row + i] && !isUsedDiagonalLineDown[row - i + N - 1] {
            isUsedColumn[i] = true
            isUsedDiagonalLineUp[row + i] = true
            isUsedDiagonalLineDown[row - i + N - 1] = true
            let nextRow = row + 1
            nQueenRecursion(row: nextRow)
            isUsedColumn[i] = false
            isUsedDiagonalLineUp[row + i] = false
            isUsedDiagonalLineDown[row - i + N - 1] = false
        }
    }
}
 
nQueenRecursion(row: 0)
print(ans)
