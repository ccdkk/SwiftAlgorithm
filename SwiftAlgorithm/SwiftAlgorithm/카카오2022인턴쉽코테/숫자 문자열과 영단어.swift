//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/23/23.
//

import Foundation

func solution(_ s:String) -> Int {
    var ans = ""
    var tempString = ""
    var dictionary: [String: String] = ["zero": "0", "one": "1", "two":"2", "three":"3", "four":"4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    for str in s.map { String($0) } {
        if Int(str) != nil {
            ans += str
        } else {
            tempString += str
            if let num = dictionary[tempString] {
                ans += num
                tempString = ""
            }
        }
    }
    return Int(ans)!
}

// replaceOccurence 활용
func goodSolution(_ s:String) -> Int {
    let arr = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var str = s
    for i in 0..<arr.count {
        str = str.replacingOccurrences(of: arr[i], with: String(i))
    }
    return Int(str)!
}

print(goodSolution("one4seveneight"))
