//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/02.
//

import Foundation

let information = """
문자열 my_string과 정수 num1, num2가 매개변수로 주어질 때, my_string에서 인덱스 num1과 인덱스 num2에 해당하는 문자를 바꾼 문자열을 return 하도록 solution 함수를 완성해보세요.
"""

func solution(_ my_string:String, _ num1:Int, _ num2:Int) -> String {
    var myString = my_string.map { String($0) }
    myString.swapAt(num1, num2)
    return myString.joined()
}

solution("hello", 1, 2)
