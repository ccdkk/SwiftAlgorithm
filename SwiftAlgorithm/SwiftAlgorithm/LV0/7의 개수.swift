//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/11.
//

import Foundation

func solution(_ array:[Int]) -> Int {
    var ans = 0
    array.forEach { int in
        ans += String(int).components(separatedBy: "7").count - 1
    }
    return ans
}

func solution1(_ array:[Int]) -> Int { //어차피 개수를 구하는 것이라면 다 더하고 char로써의 7의 개수를 세도 됨
    return array.map{String($0)}.joined().filter{$0 == "7"}.count
}
