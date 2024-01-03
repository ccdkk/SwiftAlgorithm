//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 12/29/23.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let m = nm[0], n = nm[1]
var tomatoCount = 0
var queue = [[Int]]()
var queueIndex = 0
var graph = [[Int]]()
var visited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)

for i in 0..<n {
    let data = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(data)
    for (j, value) in data.enumerated() {
        if value == 1 {
            queue.append([i, j])
            visited[i][j] = 0
        }
    }
    tomatoCount += data.filter { $0 != -1}.count
}

let dx = [0, 1, 0, -1]
let dy = [-1, 0, 1, 0]

while queue.count > queueIndex {
    let curPoint = queue[queueIndex]
    let curDistance = visited[curPoint[0]][curPoint[1]]
    
    for (x, y) in zip(dx, dy) {
        let nextX = curPoint[0] + x
        let nextY = curPoint[1] + y
        
        if nextX >= 0 && nextX < n && nextY >= 0 && nextY < m {
            if visited[nextX][nextY] == -1 && graph[nextX][nextY] != -1 {
                queue.append([nextX, nextY])
                visited[nextX][nextY] = curDistance + 1
            }
        }
    }
    queueIndex += 1
}

if tomatoCount != queueIndex {
    print(-1)
} else {
    let lastOne = queue.last!
    print(visited[lastOne[0]][lastOne[1]])
}
