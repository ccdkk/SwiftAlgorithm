//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/24/23.
//

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: N+1)
var visited = [Bool](repeating: false, count: N+1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    graph[u].append(v)
    graph[v].append(u)
}

func DFS(startNode: Int) {
    visited[startNode] = true
    
    for n in graph[startNode] {
        if !visited[n] {
            visited[n] = true
            DFS(startNode: n)
        }
    }
}

DFS(startNode: 1)
print(visited[1...].filter { $0 }.count - 1)
