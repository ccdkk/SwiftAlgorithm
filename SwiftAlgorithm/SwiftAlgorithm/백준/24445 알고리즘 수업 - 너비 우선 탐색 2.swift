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
var needToVisit: [Int] = []
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    graph[u].append(v)
    graph[v].append(u)
}


func bfs(startNode: Int) {
    var depth = 0
    // swift에서 removeFirst의 시간 복잡도가 O(n) 이므로 firstIndex를 늘려주는 방식으로 데이터에 접근하여
    // Stack을 흉내낼 수 있다.
    var firstIndex = 0
    var endIndex = 1
    needToVisit.append(startNode)
    
    while firstIndex <= endIndex {
        let nextNode = needToVisit[firstIndex]
        firstIndex += 1
        if visited[nextNode] == 0 {
            depth += 1
            visited[nextNode] = depth
            needToVisit += graph[nextNode].sorted(by: >)
            endIndex = needToVisit.count - 1
        }
    }
}

bfs(startNode: R)
print(visited[1...].map { String($0) }.joined(separator: "\n"))
