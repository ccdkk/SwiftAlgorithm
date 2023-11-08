//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/7/23.
//

import Foundation

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let N = input[0]
//let M = input[1]
//var sums: [[Int]] = []
//
//
//let nums = readLine()!.split(separator: " ").map { Int($0)! }
//
//var psum = Array(repeating: nums[0], count: N)
//for _ in 0..<M {
//    sums.append(readLine()!.split(separator: " ").map { Int($0)! })
//}
//
//for i in 0..<N {
//    if i == 0 {
//        continue
//    }
//    psum[i] = psum[i-1] + nums[i]
//}
//
//for sum in sums {
//    let end = sum[1] - 1 == 0 ? psum[0] :psum[sum[1]-1]
//    let start = sum[0] - 2 == -1 ? 0 : psum[sum[0]-2]
//    print(end - start)
//}

// 간단한 구현
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var array = [0] + readLine()!.split(separator: " ").map { Int($0)! }
for i in 1...n {
    array[i] += array[i - 1]
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let i = input[0], j = input[1]
    print(array[j] - array[i - 1])
}

//11659 누적 합 구간 합 구하기4.swift
