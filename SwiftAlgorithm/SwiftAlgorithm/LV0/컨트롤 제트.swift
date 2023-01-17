//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/16.
//

import Foundation

func solution(_ s:String) -> Int {
    var str =  s.components(separatedBy: " ")
    while str.contains("Z") {
        let index = str.firstIndex(of: "Z")!
        str.removeSubrange(index - 1...index)
    }
    return str.map { Int($0)! }.reduce(0, +)
}

// 스택을 이용한 풀이
func solution1(_ s: String) -> Int {
    // int를 하나하나 넣다가 Z를 만나면 가장 마지막에 넣었던 element를 삭제하는 방식
    var stack = [Int]()

    for w in s.components(separatedBy: [" "]) {
        if w == "Z" {
            stack.popLast()
        } else {
            stack.append(Int(w)!)
        }
    }
    return stack.reduce(0, +)
}

solution("1 2 Z 3")
