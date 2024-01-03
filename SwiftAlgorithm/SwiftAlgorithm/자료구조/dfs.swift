//
//  dfs.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/24/23.
//

import Foundation

// A에 연결된 친구들, B에 연결된 친구들 ..
let graph: [String: [String]] = [
    "A": ["B", "C"],
    "B": ["A", "D", "E"],
    "C": ["A", "F"],
    "D": ["B"],
    "E": ["B"],
    "F": ["C"]
]

// 한 개의 큐와 한 개의 스택으로 구현한다.
// 방문 해야하는 노드를 저장하는 Stack(needVisitStack)
// 이미 방문한 노드를 저장하는 Queue visitedQueue
// 시간 복잡도 O(V+E)
func DFS(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitStack: [String] = [start]
    
    // visit할게 남아있으면 계속 진행
    while !needVisitStack.isEmpty {
        let node: String = needVisitStack.removeLast()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitStack += graph[node] ?? []
    }
    
    return visitedQueue
}
print(DFS(graph: graph, start: "A"))


func DFSPractice(graph: [String:[String]], start: String) -> [String] {
    var visited: [String] = []
    
    func DFS(start: String) {
        visited.append(start)
        
        for n in graph[start]! {
            if !visited.contains(n) {
                DFS(start: n)
            }
        }
    }
    
    DFS(start: start)
    return visited
}

print(DFSPractice(graph: graph, start: "A"))
