//
//  ㅡain.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/2/24.
//

import Foundation

let t = Int(readLine()!)!
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

for _ in 0..<t {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mnk[0], n = mnk[1], k = mnk[2]
    var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var queue = [[Int]]()
    var queueIndex = 0
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var ans = 0
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        graph[input[1]][input[0]] = 1
    }
    // queue에 넣을지 말지 결정을 2중 포문을 통해 하고
    // 각각의 포문안에서 while을 돌려 queue에 넣는다.
    // while을 통해 bfs를 한 번 끝내면 ans += 1
    
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] != 0 && !isVisited[i][j] {
                queue.append([i, j])
                isVisited[i][j] = true
                
                while queueIndex < queue.count {
                    let curPoint = queue[queueIndex]
                    for (x, y) in zip(dx, dy) {
                        let nextX = curPoint[0] + x
                        let nextY = curPoint[1] + y
                        if nextX < 0 || nextX >= n || nextY < 0 || nextY >= m {
                            continue
                        }
                        // isVisited와 문제의 추가적인 요소 체크하기 (배추가 없는, graph가 0인 좌표는 추가 x)
                        if isVisited[nextX][nextY] || graph[nextX][nextY] == 0 {
                            continue
                        }
                        
                        queue.append([nextX, nextY])
                        isVisited[nextX][nextY] = true
                    }
                    queueIndex += 1
                }
                ans += 1
            }
        }
    }
    print(ans)
}
