//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/24/23.
//

import Foundation

let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let N = nmr[0]
let M = nmr[1]
let R = nmr[2]
var visited = [Int](repeating: 0, count: N+1) // visited에 depth를 기록할 것임
var graph = [[Int]](repeating: [], count: N+1)
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0], v = input[1]
    // Node를 대표한느 것이 숫자로 된 경우에는 배열의 순서가 해당 노드를 의미한다고 보고 연결하면 된다.
    graph[u].append(v)
    graph[v].append(u)
}

var depth = 1

func dfs(node: Int) {
    visited[node] = depth
    for nextNode in graph[node].sorted() {
        if visited[nextNode] == 0 {
            depth += 1
            dfs(node: nextNode)
        }
    }
}

dfs(node: R)
print(visited[1...].map { String($0) }.joined(separator: "\n"))
