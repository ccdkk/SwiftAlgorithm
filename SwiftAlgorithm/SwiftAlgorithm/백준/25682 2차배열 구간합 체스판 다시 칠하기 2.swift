//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/8/23.
//

import Foundation

// Idea: 누적합. 정상인 체스판과 비교하여 다른 경우를 2차원 배열에 표시하고 주어진 n x n 구간에서
// 구간합이 가장 작은 경우를 구하기
// 정상인 체스판은 왼쪽상단이 B인 경우와 W인 경우가 있음
// 각각에서 가장 작은 값을 구하고 그 중 더 작은 값을 출력

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let N = nmk[0]
let M = nmk[1]
let K = nmk[2]
var whole:[[Character]] = [["A"]]

for _ in 0..<N {
    whole.append(["A"] + Array(readLine()!).map { $0 })
}

func minCount(character: Character) -> Int{
    
    var psum = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)
    
    for i in 1..<N+1 {
        for j in 1..<M+1 {
            if (i + j) % 2 == 0 {
                psum[i][j] = whole[i][j] == character ? 0 : 1
            } else {
                psum[i][j] = !(whole[i][j] == character) ? 0 : 1
            }
            psum[i][j] = psum[i][j] + psum[i-1][j] + psum[i][j-1] - psum[i-1][j-1]
        }
    }
    
    var ans = N * M
    
    for i in 1...(N - K + 1) {
        for j in 1...(M - K + 1) {
            ans = min(
                ans,
                psum[i+K-1][j+K-1] - psum[i+K-1][j-1] - psum[i-1][j+K-1] + psum[i-1][j-1]
            )
        }
    }
    
    return ans
}

print(min(minCount(character: "B"), minCount(character: "W")))
