//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/10.
//

import Foundation

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
    var ans = 0
    for index in (i...j) {
        ans += String(index).filter { Int(String($0)) == k }.count
    }
    return ans
}

func solution1(_ i:Int, _ j:Int, _ k:Int) -> Int {
    return (i...j)
    .map {
        String($0).filter { String($0) == String(k) }.count
    }
    .reduce(0, +)
}
