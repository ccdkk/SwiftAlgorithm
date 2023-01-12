//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/10.
//

import Foundation

func solution(_ bin1:String, _ bin2:String) -> String {
    let ans = Int(bin1, radix: 2)! + Int(bin2, radix: 2)!
    return String(ans, radix: 2)
}

print(solution("10", "11"))
