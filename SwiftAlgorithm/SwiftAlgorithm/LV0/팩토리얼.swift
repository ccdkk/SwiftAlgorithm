//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/10.
//

import Foundation

func solution(_ n:Int) -> Int {
    func factorial(_ input: Int) -> Int {
        if input <= 1 {
            return 1
        }
        
        return input * factorial(input - 1)
    }
    
    var ans = 0
    while factorial(ans) <= n {
        ans += 1
    }
    return ans - 1
}
