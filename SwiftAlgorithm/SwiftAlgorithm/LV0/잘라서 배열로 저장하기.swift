//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/12.
//

import Foundation

func solution(_ my_str:String, _ n:Int) -> [String] {
    let times = my_str.count / n
    var tempStr = my_str
    var ans: [String] = []
    var range = tempStr.startIndex..<tempStr.index(tempStr.startIndex, offsetBy: n)
    
    for _ in (1...times) {
        ans.append(String(tempStr[range]))
        tempStr.removeSubrange(range)
    }
    tempStr.isEmpty ? nil : ans.append(tempStr)
    
    return ans
}

print(solution("deifjslief", 4))
