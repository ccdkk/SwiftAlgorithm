//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/16.
//

import Foundation

func solution(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        
        return gcd(b, a % b)
    }
    
    var sum = [numer1 * denom2 + numer2 * denom1, denom1 * denom2]
    
    
    return sum.map { $0 / gcd(sum[0], sum[1]) }
}

solution(1, 2, 3, 4)
