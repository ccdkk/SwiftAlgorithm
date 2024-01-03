//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 12/29/23.
//

import Foundation

// 지훈이를 먼저 이동시키고 그 뒤에 불의 이동 위치를 queue에 넣는다.
// 불이 현재 지훈이의 위치와 같다면, IMPOSSIBLE을 출력한다. -> 지훈의 현재 위치를 추정할 수 없음.
// 불의 bfs를 돌려서 graph를 새로 구성함.
// 그 이후의 지훈이의 bfs를 돌리는데
// 지훈이가 갈 수 없는 구역은 이미 막힌 곳과, 불이 붙은지역인데
// 지훈이는 불의 이동거리보다 작은 곳만 갈 수 있다.
// IMPOSSIBLE을 판단하는 기준은 지훈이가 이동할 공간이 없을 때 출력
// IMPOSSIBLE 없이 지훈이가 가장자리에 닿으면 해당 값을 출력한다.

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let r = rc[0], c = rc[1]

var fireGraph = [[String]]()
var jGraph = [[String]]()

var fireQueue = [[Int]]()
var jQueue = [[Int]]()

var fireIndex = 0
var jIndex = 0

var fireVisited = [[Int]](repeating: [Int](repeating: -1, count: c), count: r)
var jVisited = [[Int]](repeating: [Int](repeating: -1, count: c), count: r)
for i in 0..<r {
    let input = readLine()!.map { String($0) }
    for (j, value) in input.enumerated() {
        if value == "F" {
            fireQueue.append([i, j])
            fireVisited[i][j] = 0
        }
        if value == "J" {
            jQueue.append([i, j])
            jVisited[i][j] = 0
        }
    }
    fireGraph.append(input)
    jGraph.append(input)
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

while fireQueue.count > fireIndex {
    let curPoint = fireQueue[fireIndex]
    let curDist = fireVisited[curPoint[0]][curPoint[1]]
    
    for (x, y) in zip(dx, dy) {
        let nextX = curPoint[0] + x
        let nextY = curPoint[1] + y
        
        if nextX < 0 || nextX >= r || nextY < 0 || nextY >= c {
            continue
        }
        
        if fireVisited[nextX][nextY] == -1 && fireGraph[nextX][nextY] != "#" {
            fireQueue.append([nextX, nextY])
            fireVisited[nextX][nextY] = curDist + 1
        }
    }
    fireIndex += 1
}

var isAbleToEscape = false
var ansTime = 0

while jQueue.count > jIndex {
    let curPoint = jQueue[jIndex]
    let curDist = jVisited[curPoint[0]][curPoint[1]]
    
    if [0, r-1].contains(curPoint[0]) || [0, c-1].contains(curPoint[1]) {
        isAbleToEscape = true
        ansTime = curDist
        break
    }
    
    for (x, y) in zip(dx, dy) {
        let nextX = curPoint[0] + x
        let nextY = curPoint[1] + y
        
        if nextX < 0 || nextX >= r || nextY < 0 || nextY >= c {
            continue
        }
        
        if jVisited[nextX][nextY] == -1 && jGraph[nextX][nextY] != "#" {
            // MARK: 틀린 부분 fireVisited[nextX][nextY] > (curDist + 1) 만 판단할 것이 아니라
            // fireVisited[nextX][nextY] 가 -1인 경우는 fire의 경로가 아니라는 뜻이므로 분기처리해서 판단해야함.
            if fireVisited[nextX][nextY] == -1 || fireVisited[nextX][nextY] > (curDist + 1) {
                jQueue.append([nextX, nextY])
                jVisited[nextX][nextY] = curDist + 1
            }
        }
    }
    jIndex += 1
}

if isAbleToEscape {
    print(ansTime+1)
} else {
    print("IMPOSSIBLE")
}
