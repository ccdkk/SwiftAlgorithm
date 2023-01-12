//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/10.
//

import Foundation

func solution1(_ my_string:String) -> String {
    var ans: [Character] = []
    my_string.forEach { char in
        if !ans.contains(char) {
            ans.append(char)
        }
    }
    return String(ans)
}

func solution2(_ myString:String) -> String { // 좋은 풀이라 생각
    var set = Set<Character>()
    let sque = myString.filter{set.insert($0).inserted}
    return sque
}

print(solution2("people"))
