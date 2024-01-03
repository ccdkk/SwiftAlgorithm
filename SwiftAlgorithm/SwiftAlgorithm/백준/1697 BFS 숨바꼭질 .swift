//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/24/23.
//

import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0], M = NK[1]
var visited = [Bool](repeating: false, count: 200001)

func bfs(start: Int) {
    var queue = [(start, 0)]
    var firstIndex = 0 // removeFirst를 사용하게 되면 swift에서는 비효율적이기(O(N)) 때문
    
    while firstIndex < queue.count {
        let nowNode = queue[firstIndex]
        visited[nowNode.0] = true
        // 가능한 인접 포인트 3개
        if nowNode.0 == M {
            print(nowNode.1)
            break
        }
        
        let nextNodes = [(nowNode.0 - 1, nowNode.1 + 1), (nowNode.0 + 1, nowNode.1 + 1), (nowNode.0 * 2, nowNode.1 + 1)]
        for nextNode in nextNodes {
            if 0...200000 ~= nextNode.0 {
                if !visited[nextNode.0] {
                    queue.append(nextNode)
                }
            }
        }
        firstIndex += 1
    }
}

bfs(start: N)
