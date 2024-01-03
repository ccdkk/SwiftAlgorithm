//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/23/23.
//

import Foundation

func solution(_ expression:String) -> Int64 {
    var nums = expression.components(separatedBy: ["+", "*", "-"]).map { Int($0)! }
    var operators = expression.components(separatedBy: .decimalDigits).filter { $0 != ""}
    var operatorKind = Array(Set(operators))
    var orderList: [[String]] = []
    if operatorKind.count == 1 {
        orderList.append(operatorKind)
    } else if operatorKind.count == 2 {
        orderList.append(operatorKind)
        orderList.append([operatorKind[1], operatorKind[0]])
    } else {
        orderList = [["+", "*", "-"], ["+", "-", "*"], ["-", "*", "+"], ["-", "+", "*"], ["*", "+", "-"], ["*", "-", "+"]]
    }
    
    // orders를 활용해서 우선순위를 만들어야 함
    var ans = 0
    for kind in orderList {
        var result = 0
        var tempNums = nums
        var tempOperators = operators
        for order in kind {
            var removedIndex: [Int] = []
            for oper in tempOperators {
                if oper == order {
                    let i = Int(tempOperators.firstIndex(of: oper)!)
                    switch order {
                    case "+": tempNums[i] = tempNums[i] + tempNums[i+1]
                    case "*": tempNums[i] = tempNums[i] * tempNums[i+1]
                    case "-": tempNums[i] = tempNums[i] - tempNums[i+1]
                    default: break
                    }
                    removedIndex.append(i)
                    tempNums.remove(at: i+1)
                    tempOperators.remove(at: i)
                }
            }
        }
        result = abs(tempNums[0])
        ans = max(result, ans)
    }
    
    // operators에 있는 요소를 파악해서, 우선순위의 경우의수를 생각하고
    // 해당 경우의수로 연산을 진행하여 나온 값중에서 가장 큰 값을 출력한다.
    return Int64(ans)
}

