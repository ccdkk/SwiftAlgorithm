//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/18.
//

import Foundation

func solution(_ chicken:Int) -> Int {
    var chickens = chicken
    var orderedChicken = 0
    
    while chickens >= 10 {
        let quotient = chickens / 10
        let rest = chickens % 10
        chickens = quotient + rest
        orderedChicken += quotient
    }
    return orderedChicken
}
print(solution(1081))
//1081 -> 108 + 1
//109 -> 10 + 9
//19 -> 1 + 9
//10 -> 1
//몫 + 나머지 / 10 반복
