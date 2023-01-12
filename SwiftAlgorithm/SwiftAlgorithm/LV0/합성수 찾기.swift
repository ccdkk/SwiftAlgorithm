//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/03.
//

import Foundation

func mySolution(_ n:Int) -> Int { // 틀림
    func isPrime(_ x: Int) -> Bool {
        let rootInt = Int(sqrt(Double(x)))
        var divisors: [Int] = []
        if Double(rootInt) == sqrt(Double(x)) {
            return false
        } else {
            for value in (1...rootInt) {
                if x % value == 0 {
                    divisors.append(value)
                }
            }
        }
        
        
        if divisors.count * 2 == 2 {
            print(x)
            return true
        } else {
            return false
        }
    }
    return (2...n).filter { !isPrime($0) }.count
}

func solution2(_ n:Int) -> Int {
    return (1...n).filter { i in
        (1...i).filter { i % $0 == 0 }.count >= 3
    }.count
}

solution(100)
