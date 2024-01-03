//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/2/24.
//

import Foundation

// 투포인터 2230 수 고르기

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var nums: [Int] = []
for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}
nums.sort()
var st = 0
var en = 0
var ans = 2000000000
for i in 0..<n {
    while en < n && nums[en] - nums[i] < m {
        en += 1
    }
    if en == n {
        break
    }
    ans = min(ans, nums[en] - nums[i])
}

print(ans)


//for i in 0..<n {
//    while en < n && nums[en] - nums[i] < m {
//        en += 1
//    }
//    if en == n {
//        break
//    }
//    ans = min(ans, nums[en] - nums[i])
//}

while st <= en {
    if en >= n { // en이 범위를 벗어나면 종료 en을 증가시킨다는건 마지막요소에서 m을 만족시키지 못한다는 의미이기 때문에 st는 볼 필요가 없다.
        break
    }
    
    let diff = nums[en] - nums[st]
    if diff >= m {
        ans = min(ans, diff)
        st += 1
    } else {
        en += 1
    }
}
