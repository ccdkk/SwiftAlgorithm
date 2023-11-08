//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/7/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
let nums = [0] +  readLine()!.split(separator: " ").map { Int($0)! }
var psum = Array(repeating: 0, count: N+1)

for i in 1...N {
    psum[i] = (psum[i-1] + nums[i]) % M
}

func sum(_ N: Int) -> Int {
    return ((1+N)*N) / 2
}

var ans = 0
var counts: [Int: Int] = [:]

for num in psum {
    if let count = counts[num] {
        counts[num] = count + 1
    } else {
        // 그렇지 않으면, 새로운 키로 추가
        counts[num] = 1
    }
}

for key in counts.keys {
    ans += sum(counts[key]!-1)
}
print(ans)


//0 1 0 0 1 0
//
//12 13 15 ->2-0 3-0 5-0 첫영과 나머지를 이음
//24 -> 누적합 4-1.  1과을 이음
//33 35 -> 3-2, 5-2 두번째영과 나머지 영을 이음
//45 -> 5-3 세번째영과 나머지 영을 이음
//
//3개 12 13 15
//1과 1을 이어 개
//1개

// 조합으로 푸는 방법
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0], m = input[1]
//var array = readLine()!.split(separator: " ").map { Int($0)! }
//for i in 1..<n {
//    array[i] += array[i - 1]
//}
//
//let mod = Dictionary(array.map { ($0 % m, 1) }, uniquingKeysWith: +)
//
//var answer = mod[0, default: 0]
//
//for value in mod.values {
//    answer += value * (value - 1) / 2
//}
//
//print(answer)
