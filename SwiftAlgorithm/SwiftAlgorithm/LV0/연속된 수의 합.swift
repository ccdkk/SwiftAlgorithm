//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/16.
//

import Foundation

func solution(_ num:Int, _ total:Int) -> [Int] {
    
    if num % 2 == 1 {
        let center = total / num
        return Array(((center - (num / 2))...(center + (num / 2))))
    } else {
        let center = total / num
        return Array(((center - (num / 2) + 1)...(center + (num / 2))))
    }
}

print(solution(4 , 14))
