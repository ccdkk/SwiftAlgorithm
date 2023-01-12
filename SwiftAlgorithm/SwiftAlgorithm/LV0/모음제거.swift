//
//  dd.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2022/12/31.
//

import Foundation

func mySolution(_ my_string:String) -> String {
    return my_string.components(separatedBy: ["a", "e", "i", "o", "u"]).joined()
}

func solution1(_ my_string:String) -> String {
    return my_string.filter { !["a", "e", "i", "o", "u"].contains($0)}
}

func solution2(_ my_string:String) -> String {
    return my_string.replacingOccurrences(of: "[aeiou]", with: "", options: .regularExpression)
}

print(solution2("bueeisss"))
