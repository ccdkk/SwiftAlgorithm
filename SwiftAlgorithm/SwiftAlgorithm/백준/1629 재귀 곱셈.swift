//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 12/30/23.
//

import Foundation

// 백준 1629 곱셈

let abc = readLine()!.split(separator: " ").map { Int($0)! }
let a = abc[0], b = abc[1], c = abc[2]

func recursion(_ num: Int) -> Int {
    if num == 1 { return a % c }
    
    let rest = num % 2
    let value = recursion(num / 2)
    
    if rest == 0 {
        return value % c * value % c
    } else {
        return value % c * value % c * a % c
    }
}

print(recursion(b))
