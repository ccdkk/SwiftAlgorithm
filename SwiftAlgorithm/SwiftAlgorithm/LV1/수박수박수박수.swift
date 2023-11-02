//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/07/06.
//

import Foundation

func solution(_ n:Int) -> String {
    let str = "수박"
    var criterion = n / 2
    var ans = ""
    print(criterion)
    
    while criterion > 0 {
        ans += str
        criterion -= 1
        
    }
    
    if n % 2 == 0 {
        return ans
    } else {
        return ans + "수"
    }
}

// 좋은 솔루션

func solution2(_ n:Int) -> String {
    return "\(String(repeating: "수박", count: n / 2))\(n % 2 == 0 ? "" : "수")"
}

func solution3(_ n:Int) -> String {
    return (0..<n).map{($0%2==0 ? "수":"박")}.reduce("", +)
}
