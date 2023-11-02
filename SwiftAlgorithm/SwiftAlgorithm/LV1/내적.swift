//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/07/11.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
     
    var ans = 0
    for (idx, num) in a.enumerated() {
        ans += num * b[idx]
    }
    return ans
}


// 좋은 풀이
func solution2(_ a:[Int], _ b:[Int]) -> Int {
    print(zip(a,b).map{ $1 })
    return zip(a, b).map(*).reduce(0, +)
}

print(solution2([1,2,3], [4, 5, 6]))
