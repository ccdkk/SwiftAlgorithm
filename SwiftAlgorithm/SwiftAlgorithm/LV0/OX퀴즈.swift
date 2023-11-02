//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/15.
//

import Foundation

func solution(_ quiz:[String]) -> [String] {
    func calculate(expression: String) -> Bool {
        let pieces = expression.components(separatedBy: [" "])
        if pieces[1] == "+" {
            return Int(pieces[0])! + Int(pieces[2])! == Int(pieces[4])!
        } else {
            return Int(pieces[0])! - Int(pieces[2])! == Int(pieces[4])!
        }
    }
    
    return quiz.map { calculate(expression: $0) ? "O" : "X"}
}

print(solution(["19 - 6 = 13", "5 + 66 = 71", "5 - 15 = 63", "3 - 1 = 2"]))
