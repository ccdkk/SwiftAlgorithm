//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 12/1/23.
//

import Foundation

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let m = mn[0], n = mn[1]
var tomatoes: [[Int]] = []
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var queued: [(Int, Int, Int)] = []
var index = 0
var tomatoesCount = 0
var current: (Int, Int, Int) = (0, 0, 0)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for (j, n) in input.enumerated() {
        if n == 1 {
            queued.append((i, j, 0))
            visited[i][j] = true
        }
        if n != -1 {
            tomatoesCount += 1
        }
    }
    tomatoes.append(input)
}

while index < queued.count {
    current = queued[index]
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    for (x, y) in zip(dx, dy) {
        if current.0 + x > n - 1 || current.0 + x < 0 || current.1 + y > m - 1 || current.1 + y < 0 {
            continue
        }
        
        if !visited[current.0 + x][current.1 + y] && tomatoes[current.0 + x][current.1 + y] != -1 {
            queued.append((current.0 + x, current.1 + y, current.2 + 1))
            visited[current.0 + x][current.1 + y] = true
        }
    }
    
    index += 1
}

if index == tomatoesCount {
    print(current.2)
} else {
    print(-1)
}

