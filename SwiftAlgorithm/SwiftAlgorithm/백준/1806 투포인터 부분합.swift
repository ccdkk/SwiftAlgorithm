//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/14/23.
//

import Foundation

let ns = readLine()!.split(separator: " ").map { Int($0)! }
let N = ns[0]
let S = ns[1]
var nums = [0] + readLine()!.split(separator: " ").map { Int($0)! }

for i in 1...N {
    nums[i] = nums[i-1] + nums[i]
}

var start = 0
var end = 1
var ans = N + 1 // 10 10 1 1 1 1 1 1 1 1 1 1 의 반례를 충족하기 위해 N + 1 왜냐하면 1 10개를 더하면 S조건을 충족하는데 전체 수열의 길이와 같기 때문에 0이 출력되었음

while start < N + 1 && end < N + 1 {
    let sum = nums[end] - nums[start]
    
    if sum >= S {
        ans = min(ans, end - start)
        start += 1
    } else {
        end += 1
    }
}

if ans == N + 1{
    print(0) // 만족하는 값이 없을 경우 0 을 출력
} else {
    print(ans)
}
