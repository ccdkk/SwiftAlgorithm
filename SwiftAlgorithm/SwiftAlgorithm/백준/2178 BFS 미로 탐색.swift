//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/24/23.
//

import Foundation


// bfs는 간선의 비용이 동일할 때, 최단 경로로 방문한다는 특징이 있다.
// 즉 가중치 없는 무방향 그래프에서 최단거리를 구할 때 BFS를 활용하면 된다.
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let N = nm[0], M = nm[1]
// 방향값
let dx = [0,0,-1,1]
let dy = [-1,1,0,0]
var graph = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
for _ in 0..<N {
    graph.append(Array(readLine()!).map { Int(String($0))! })
}

func isValidCoordinate(y: Int, x: Int) -> Bool {
    return 0..<N ~= y && 0..<M ~= x
}

func bfs(y: Int, x: Int) {
    var queue = [(y,x,1)]
    var index = 0
    visited[y][x] = true
    
    // queue에 있는 모든 것들을 index가 돌 때 까지
    while queue.count > index {
        let y = queue[index].0
        let x = queue[index].1
        let d = queue[index].2
        
        if y == N-1 && x == M-1 {
            print(d)
            break
        }
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if isValidCoordinate(y: ny, x: nx) && graph[ny][nx] == 1 && !visited[ny][nx] {
                visited[ny][nx] = true
                queue.append((ny,nx,d+1))
            }
        }
        index += 1
    }
}

bfs(y: 0, x: 0)

// 2023.12.29
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(readLine()!.map { Int(String($0))! })
}

var visitied = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var queued = [[Int]]()
var queueIndex = 0

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

queued.append([0, 0])
visitied[0][0] = 1

while queued.count > queueIndex {
    let curPoint = queued[queueIndex]
    let curDistance = visitied[curPoint[0]][curPoint[1]]
    for i in 0..<4 {
        let nextX = curPoint[0] + dx[i]
        let nextY = curPoint[1] + dy[i]
        
        if nextX >= 0 && nextX < n && nextY >= 0 && nextY < m {
            if graph[nextX][nextY] != 0 && visitied[nextX][nextY] == 0 {
                queued.append([nextX, nextY])
                visitied[nextX][nextY] = curDistance + 1
            }
        }
    }
    queueIndex += 1
}
print(visitied[n-1][m-1])
