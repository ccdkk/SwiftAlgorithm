//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 12/1/23.
//

import Foundation

let testCount = Int(readLine()!)!
var inputs: [[Int]] = []

for _ in 0..<testCount {
    let I = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let end = readLine()!.split(separator: " ").map { Int($0)! }
    
    inputs.append([I, start[0], start[1], end[0], end[1]])
}

func bfs(input: [Int], start: [Int], end: [Int]) {
    var visitied = [[Bool]](repeating: [Bool](repeating: false, count: input[0]), count: input[0])
    var queued: [(Int, Int, Int)] = [(start[0], start[1], 0)]
    var index = 0
    
    while index < queued.count {
        var current = queued[index]
        if current.0 == end[0] && current.1 == end[1] {
            print(current.2)
            break
        }
        visitied[current.1][current.0] = true
        
        queued += nextNode(currentNode: current)
        index += 1
    }
    
    func nextNode(currentNode: (Int, Int, Int)) -> [(Int, Int, Int)] {
        let currentX = currentNode.0
        let currentY = currentNode.1
        let dx = [1, 1, 2, 2, -1, -1, -2, -2]
        let dy = [2, -2, 1, -1, 2, -2, -1, 1]
        var nextNode: [(Int, Int, Int)] = []
        for (i, x) in dx.enumerated() {
            let nextX = currentX + x
            let nextY = currentY + dy[i]
            if nextX > input[0] - 1 || nextX < 0 || nextY > input[0] - 1 || nextY < 0 {
                continue
            }
            if !visitied[nextY][nextX] {
                nextNode.append((nextX, nextY, currentNode.2 + 1))
                visitied[nextY][nextX] = true // 추가하는 시점에 아예 visited를 체크해야 중복 추가되는 일이 없음
            }
        }
        return nextNode
    }
}

for input in inputs {
    bfs(input: input, start: [input[1], input[2]], end: [input[3], input[4]])
}
