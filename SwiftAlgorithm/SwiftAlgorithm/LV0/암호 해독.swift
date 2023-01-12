//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/01.
//

import Foundation

func solution(_ cipher:String, _ code:Int) -> String {
    var ans = ""
    for index in stride(from: code - 1, through: cipher.count - 1, by: code) {
        ans += String(Array(cipher)[index])
    }
    return ans
}

