//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/24/23.
//

import Foundation

let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let N = nmr[0], M = nmr[1], R = nmr[2]
var visited = [Int](repeating: 0, count: N+1)
var graph = [[Int]](repeating: [], count: N+1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    graph[u].append(v)
    graph[v].append(u)
}

var depth = 1

func DFS(startNode: Int) {
    visited[startNode] = depth
    
    for nextNode in graph[startNode].sorted(by: >) {
        if visited[nextNode] == 0 {
            depth += 1
            DFS(startNode: nextNode)
        }
    }
}

DFS(startNode: R)
print(visited[1...].map { String($0) }.joined(separator: "\n"))
