//
//  1926 BFS 그림.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 12/29/23.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var picture: [[Int]] = []

for _ in 0..<n {
    picture.append( readLine()!.split(separator: " ").map { Int($0)! })
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var dx = [0,1,0,-1] 
var pictureCount = 0 // BFS의 시작점이 가능하다고 판단되면 +1
var maxArea = 0
var queued: [[Int]] = []
var queuedCount = 0 // queue가 없는 swift의 단점 보완
// 한 그림의 넓이를 아는 법 하나의 BFS를 다 돌았을 때의 count

for i in 0..<n {
    for j in 0..<m {
        if visited[i][j] || picture[i][j] == 0{
            // 이미 들린 곳이거나 0이면 BFS의 후보가 아님
            continue
        }
        
        // BFS를 돌린다.
        queued.append([i,j])
        visited[i][j] = true
        var tempMaxArea = 0 // area 측정
        
        while queued.count > queuedCount {
            let curPoint = queued[queuedCount]
            print(curPoint)
            visited[curPoint[0]][curPoint[1]] = true
            queuedCount += 1
            tempMaxArea += 1
            for z in 0..<4 {
                let nextPoint = [curPoint[0] + dx[z], curPoint[1] + dy[z]]
                // 이미 방문했거나, 해당 좌표값이 0이거나 좌표 범위 내에 있어야함
                if nextPoint[0] >= 0 && nextPoint[0] < n && nextPoint[1] >= 0 && nextPoint[1] < m
                    && !visited[nextPoint[0]][nextPoint[1]] && picture[nextPoint[0]][nextPoint[1]] != 0{
                    queued.append(nextPoint)
                    visited[nextPoint[0]][nextPoint[1]] = true
                }
            }
        }
        pictureCount += 1
        maxArea = max(maxArea, tempMaxArea)
    }
}
print(pictureCount)
print(maxArea)
