//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/31/23.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let N = nm[0]
let M = nm[1]

var lans: [Int] = []
for _ in 0..<N {
    lans.append(Int(readLine()!)!)
}

var start = 1
var end = lans.max()!
var ans = 0

while start <= end {
    let mid = (start + end) / 2
    let sum = lans.reduce(0) {
        return $0 + ($1 / mid)
    }
    
    if sum >= M {
        start = mid + 1
        ans = mid
    } else {
        end = mid - 1
    }
}

print(ans)
