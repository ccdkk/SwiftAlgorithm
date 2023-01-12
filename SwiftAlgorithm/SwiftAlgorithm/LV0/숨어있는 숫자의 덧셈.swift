//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2022/12/31.
//

import Foundation

func solution(_ my_string:String) -> Int {
    let arr = my_string.components(separatedBy: CharacterSet.decimalDigits.inverted).compactMap { Int($0) }
    
    var ans = 0
    arr.forEach { int in
        ans += String(int).map { Int(String($0))! }.reduce(0) { $0 + $1}
    }
    return ans
}
