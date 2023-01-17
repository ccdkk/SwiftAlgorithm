//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/12.
//

import Foundation

func solution(_ numbers:String) -> Int64 {
    var ans: String = numbers
    ans = ans.replacingOccurrences(of: "zero", with: "0")
    ans = ans.replacingOccurrences(of: "one", with: "1")
    ans = ans.replacingOccurrences(of: "two", with: "2")
    ans = ans.replacingOccurrences(of: "three", with: "3")
    ans = ans.replacingOccurrences(of: "four", with: "4")
    ans = ans.replacingOccurrences(of: "five", with: "5")
    ans = ans.replacingOccurrences(of: "six", with: "6")
    ans = ans.replacingOccurrences(of: "seven", with: "7")
    ans = ans.replacingOccurrences(of: "eight", with: "8")
    ans = ans.replacingOccurrences(of: "nine", with: "9")
    return Int64(Int(ans)!)
}

var dic = ["zero" : "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
func solution1(_ numbers:String) -> Int64 {
    // dictionary로 반복을 최소화한 풀이
    var answer = numbers
    for (k, v) in dic {
        answer = answer.replacingOccurrences(of: k, with: v)
    }
    return Int64(answer)!
}


print(solution1("onetwothreefourfivesixseveneightnine"))
