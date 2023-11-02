//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/24/23.
//

import Foundation

//let N = Int(readLine()!)!
//var ans = 1
//var numbers: [Int : Int] = [:]
//for i in 1...((N / 2) + 1) {
//    let sum = i * (i + 1) / 2
//    numbers[sum] = i
//    
//    if sum == N {
//        ans += 1
//    }
//
//    if numbers[sum - N] != nil {
//        ans += 1
//    }
//}

let N = Int(readLine()!)!
var start = 0
var end = 0
var sum = 0
var ans = 0

while end <= N {
    if sum > N {
        sum -= start
        start += 1
    } else if sum < N {
        end += 1
        sum += end
    } else {
        ans += 1
        end += 1
        sum += end
    }
}
print(ans)


