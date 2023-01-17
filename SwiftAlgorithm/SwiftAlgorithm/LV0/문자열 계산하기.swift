//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/12.
//

import Foundation

func solution(_ my_string:String) -> Int {
    let numbers = my_string.components(separatedBy: ["+", "-"]).map { Int($0.replacingOccurrences(of: " ", with: "")) }
    let operations = Array(my_string).filter { ["+", "-"].contains($0) }
    var ans = numbers.first!
    
    for (index, operation) in operations.enumerated() {
        if operation == "+" {
            ans! += numbers[index + 1]!
        } else {
            ans! -= numbers[index + 1]!
        }
    }
    return ans!
}

func solution1(_ my_string:String) -> Int {
    //  1 - 3 을 1 + (-3) 으로 생각하면 편하게 코딩할 수 있다.
    let changedForm = my_string.replacingOccurrences(of: " - ", with: " + -")
    return changedForm.components(separatedBy: " + ").reduce(0) { $0 + Int($1)! }
}

print(solution1("3 - 3 + 4"))
