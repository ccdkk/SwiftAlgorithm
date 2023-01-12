//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2022/12/23.
//

import Foundation

// 순서쌍의 개수
func solution(_ n:Int) -> Int {
    let approximateValue = Int(sqrt(Double(n)))
    let count = (1...approximateValue).filter { n % $0 == 0 }.count
    return Double(approximateValue) == sqrt(Double(n)) ? count * 2 - 1 : count * 2
}

print(solution(100))
