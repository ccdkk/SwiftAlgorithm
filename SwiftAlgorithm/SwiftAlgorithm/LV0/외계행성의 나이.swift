//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/02.
//

import Foundation

func mySolution(_ age:Int) -> String {
    func toAlphabet(number: String) -> String {
        switch number {
        case "0": return "a"
        case "1": return "b"
        case "2": return "c"
        case "3": return "d"
        case "4": return "e"
        case "5": return "f"
        case "6": return "g"
        case "7": return "h"
        case "8": return "i"
        case "9": return "j"
        default: return ""
        }
    }
    
    return String(age).map { toAlphabet(number: String($0)) }.joined()
}

func solution1(_ age:Int) -> String {
    let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    return String(age).map{alphabet[Int(String($0))!]}.joined()
}

func solution2(_ age:Int) -> String {
    return String(age).reduce("") { $0 + String(UnicodeScalar(97 + Int(String($1))!)!)
    }
}
