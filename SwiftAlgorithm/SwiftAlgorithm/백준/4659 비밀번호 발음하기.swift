//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/20/23.
//

import Foundation

var inputList: [String] = []

while true {
    let password = readLine()!
    if password == "end" {
        break
    }
    inputList.append(password)
}

// 모음 하나를 반드시 포함하여야 한다.
func isHaveVowel(isVowelList: [Bool]) -> Bool {
    return isVowelList.contains(true)
}

// 모음이 3개 혹은 자음이 3개 연속으로 오면 안된다.
// 모음과 자음에 따라 true, false로 분리하고 true와 false가 3개 이상 붙어있는지 확인한다.
func isHave3Char(isVowelList: [Bool]) -> Bool {
    var countTrue = 0
    var countFalse = 0
    for isVowel in isVowelList {
        if isVowel {
            countTrue += 1
            countFalse = 0
        } else {
            countFalse += 1
            countTrue = 0
        }
        
        if countTrue == 3 || countFalse == 3 {
            return true
        }
    }
    
    return false
}

// 같은 글자가 연속적으로 두번 오면 안되나 ee와 oo 는 허용한다.
func isHaveStraightChar(str: String) -> Bool {
    for i in 0..<str.count - 1 {
        let preChar = str[str.index(str.startIndex, offsetBy: i)]
        let nextChar = str[str.index(str.startIndex, offsetBy: i + 1)]
        
        if preChar == nextChar {
            if preChar == "e" || preChar == "o" {
                continue
            } else {
                return true
            }
        }
    }
    
    return false
}

for input in inputList {
    let vowel: [Character] = ["a", "e", "i", "o", "u"]
    let isVowel = input.map { vowel.contains($0) }

    if isHaveVowel(isVowelList: isVowel) &&
        !isHave3Char(isVowelList: isVowel) &&
        !isHaveStraightChar(str: input)  {
        print("<\(input)> is acceptable.")
    } else {
        print("<\(input)> is not acceptable.")
    }
}
