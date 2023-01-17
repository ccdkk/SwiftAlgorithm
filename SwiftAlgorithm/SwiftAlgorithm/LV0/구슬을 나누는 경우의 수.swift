//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/13.
//

import Foundation

func solution(_ balls:Int, _ share:Int) -> Int {
    
    if balls == share {
        return 1
    }
    
    func factorial(_ number: Int) -> Double {
        if number <=  1 {
            return 1
        }
        
        return Double(number) * factorial(number - 1)
    }
    
    print(factorial(balls))
    print(factorial(share))
    return Int(factorial(balls) / (factorial(balls - share) * factorial(share)))
}

print(solution(5, 3))
