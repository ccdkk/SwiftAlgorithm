//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/01.
//

import Foundation

func solution(_ n:Int) -> [Int] {
    var array = (1...(n / 2)).filter { n % $0 == 0 }
    array.append(n)
    return array
}

print(solution(1000))
