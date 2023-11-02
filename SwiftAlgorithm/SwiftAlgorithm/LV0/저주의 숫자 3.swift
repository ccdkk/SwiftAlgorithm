//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/10.
//

import Foundation

func solution(_ n:Int) -> Int {
    return toInt3(n)
    
    func toInt3(_ number: Int) -> Int {
        if number == 1 {
            return 1
        }
        
        var previousNumb = toInt3(number - 1) + 1
        
        while (previousNumb) % 3 == 0 || String(previousNumb).map({ $0 }).contains("3") {
            previousNumb += 1
        }
        
        return previousNumb
    }
}
