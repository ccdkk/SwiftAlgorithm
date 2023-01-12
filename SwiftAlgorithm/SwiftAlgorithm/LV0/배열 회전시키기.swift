//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/02.
//

import Foundation

func mySolution(_ numbers:[Int], _ direction:String) -> [Int] {
    var arr: [Int] = []
    switch direction {
    case "left":
        for index in (1...numbers.count - 1) {
            arr.append(numbers[index])
        }
        arr.append(numbers.first!)
    case "right":
        arr.append(numbers.last!)
        for index in (0...numbers.count - 2) {
            arr.append(numbers[index])
        }
    default:
        break
    }
    return arr
}

func mySolution1(_ numbers:[Int], _ direction:String) -> [Int] {
    var numbers = numbers
    if direction == "left" {
        numbers.append(numbers.removeFirst())
    } else {
        numbers.insert(numbers.removeLast(), at: 0)
    }
    return numbers
}

print(mySolution1([4, 455, 6, 4, -1, 45, 6], "left"))
