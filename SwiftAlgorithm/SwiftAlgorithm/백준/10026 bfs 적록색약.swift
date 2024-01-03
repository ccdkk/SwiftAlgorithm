//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/2/24.
//

import Foundation

// 10026 적록색약

let n = Int(readLine()!)!
var graph: [[String]] = []
var isVisitedColor = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var isVisitedColorWeak = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var colorQueue: [[Int]] = []
var colorWeakQueue: [[Int]] = []
var colorQueueIndex = 0
var colorWeakQueueIndex = 0

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var colorAns = 0
var colorWeakAns = 0

for _ in 0..<n {
    graph.append(readLine()!.map { String($0) })
}

for i in 0..<n {
    for j in 0..<n {
        if !isVisitedColor[i][j] {
            colorQueue.append([i, j])
            isVisitedColor[i][j] = true
            
            while colorQueue.count > colorQueueIndex {
                let curPoint = colorQueue[colorQueueIndex]
                let curColor = graph[curPoint[0]][curPoint[1]]
                for (x, y) in zip(dx, dy) {
                    let nextX = curPoint[0] + x
                    let nextY = curPoint[1] + y
                    
                    if nextX < 0 || nextX >= n || nextY < 0 || nextY >= n { continue }
                    if isVisitedColor[nextX][nextY] || graph[nextX][nextY] != curColor { continue }
                    
                    colorQueue.append([nextX, nextY])
                    isVisitedColor[nextX][nextY] = true
                }
                colorQueueIndex += 1
            }
            colorAns += 1
        }
        
        if !isVisitedColorWeak[i][j] {
            colorWeakQueue.append([i, j])
            isVisitedColorWeak[i][j] = true
            
            while colorWeakQueue.count > colorWeakQueueIndex {
                let curPoint = colorWeakQueue[colorWeakQueueIndex]
                let curColor = graph[curPoint[0]][curPoint[1]]
                for (x, y) in zip(dx, dy) {
                    let nextX = curPoint[0] + x
                    let nextY = curPoint[1] + y
                    
                    if nextX < 0 || nextX >= n || nextY < 0 || nextY >= n { continue }
                    if isVisitedColorWeak[nextX][nextY] { continue }
                    if ["R", "G"].contains(curColor) {
                        if graph[nextX][nextY] == "B" { continue }
                    } else {
                        if graph[nextX][nextY] != "B" { continue }
                    }
                    
                    colorWeakQueue.append([nextX, nextY])
                    isVisitedColorWeak[nextX][nextY] = true
                }
                colorWeakQueueIndex += 1
            }
            colorWeakAns += 1
        }
    }
}

print("\(colorAns) \(colorWeakAns)")
