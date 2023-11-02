//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/18/23.
//

import Foundation

func Combination(_ N: Int, _ M: Int) -> Int {
    let result = factorial(N) / (factorial(N-M) * factorial(M))
    return result
}

func factorial(_ N: Int) -> Int {
    if N <= 1 {
        return 1
    } else {
        return N * factorial(N - 1)
    }
}

func solution(_ N: Int, _ M: Int, _ K: Int) -> Double {
    let total = Combination(N, M)
    var target = 0
    
    for idx in K...M {
        target += Combination(M, idx) * Combination((N - M), M - idx)
    }
    
    return Double(target) / Double(total)
}

let input = readLine()
let numbers = input!.split(separator: " ").compactMap { Int($0) }

print(solution(numbers[0], numbers[1], numbers[2]))
