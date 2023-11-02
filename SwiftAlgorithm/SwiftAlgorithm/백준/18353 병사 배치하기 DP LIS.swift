//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/23/23.
//

import Foundation

var cnt = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var ans = Array(repeating: 1, count: cnt)

// O(N^2)의 시간 복잡도
func LIS_DP() {
    for i in 0..<numbers.count {
        for j in 0..<i {
            if numbers[i] < numbers[j] {
                ans[i] = max(ans[i], ans[j] + 1)
            }
        }
    }
    
    print(cnt - ans.max()!)
}

LIS_DP()
