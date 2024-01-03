//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/2/24.
//

import Foundation

// 1806 부분합

let ns = readLine()!.split(separator: " ").map { Int($0)! }
let n = ns[0], s = ns[1]
var nums = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var tot = 0



// nums배열 자체를 활용한 버전
//tot = nums[1]
//var ans = 100000001
//var en = 1
//for st in 1..<n+1 {
//    while en < n+1 && tot < s {
//        en += 1
//        if en != n + 1 {
//            tot += nums[en]
//        }
//    }
//    if en == n+1 { break }
//    ans = min(ans, en - st + 1)
//    tot -= nums[st]
//}
//if ans == 100000001 {
//    print(0)
//} else {
//    print(ans)
//}


// 부분합 버전
//var sums = [Int](repeating: 0, count: n+1)
//
//sums[1] = nums[1]
//for i in 2..<n+1 {
//    sums[i] = nums[i] + sums[i-1]
//}
//
//var en = 1
//var ans = 100000001
//for st in 1..<n+1 {
//    while en < n+1 && sums[en] - sums[st-1] < s {
//        en += 1
//    }
//    if en == n+1 { break }
//    ans = min(ans, en - st + 1)
//}
//if ans == 100000001 {
//    print(0)
//} else {
//    print(ans)
//}
