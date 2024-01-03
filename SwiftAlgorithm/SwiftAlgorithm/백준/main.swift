//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/2/24.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var graph: [[Int]] = []
// 안부수고도 이동이 가능한 경우. -> 가장 최적의 부숨을 찾아야함.
// 부서야지만 이동이 가능한 경우.
// 부서도 이동이 불가능한 경우.
// 이미 부순 상태인 진행상황과, 아직 부수지 않은 진행상황을
for _ in 0..<n {
    graph.append(readLine()!.map { Int(String($0))! })
}

var queue: [[Int]] = []
var queueIndex = 0
var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 2), count: m), count: n)
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var result = -1
// 시작점도 이동 거리로 친다.
dist[0][0][0] = 1
dist[0][0][1] = 1 // 3차원이 1이면 이미 벽을 부순경우
queue.append([0, 0, 0])
while queueIndex < queue.count {
    let curPoint = queue[queueIndex]
    let curDist = dist[curPoint[0]][curPoint[1]][curPoint[2]]
    queueIndex += 1
    
    if curPoint[0] == n-1, curPoint[1] == m-1 {
        result = dist[curPoint[0]][curPoint[1]][curPoint[2]]
        break
    }
    
    for (x, y) in zip(dx, dy) {
        var nextPoint = [curPoint[0] + x, curPoint[1] + y, curPoint[2]]
        if nextPoint[0] < 0 || nextPoint[0] >= n || nextPoint[1] < 0 || nextPoint[1] >= m {
            continue
        }
        
        if dist[nextPoint[0]][nextPoint[1]][nextPoint[2]] != -1 { continue }
        
        if graph[nextPoint[0]][nextPoint[1]] == 0 { // 벽이 아닌 경우
            queue.append(nextPoint)
            dist[nextPoint[0]][nextPoint[1]][nextPoint[2]] = curDist + 1
        } else if nextPoint[2] == 0 { // 벽인데 부술 수 있는 경우
            dist[nextPoint[0]][nextPoint[1]][1] = curDist + 1
            nextPoint[2] = 1
            queue.append(nextPoint)
        }
    }
}

print(result)
