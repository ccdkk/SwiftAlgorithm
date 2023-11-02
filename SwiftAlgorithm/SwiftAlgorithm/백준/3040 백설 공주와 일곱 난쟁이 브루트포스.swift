//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/23/23.
//

import Foundation

var numbers: [Int] = []

for _ in 0..<9 {
    numbers.append(Int(readLine()!)!)
}

func sum(_ numbers: [Int]) -> Int {
    return numbers.reduce(0) { $0 + $1 }
}

for i in 0..<numbers.count {
    for j in (i + 1)..<numbers.count {
        var newNumbers = numbers
        newNumbers.remove(at: i)
        newNumbers.remove(at: j - 1)
        if sum(newNumbers) == 100 {
            for number in newNumbers {
                print(number)
            }
        }
    }
}

// 100을 빼놓고 두개의 합으로 정답을 구하는 똑똑한 방법
let A = (0..<9).map { _ in Int(readLine()!)! }
let E = A.reduce(0, +) - 100
var R = ""
for i in 0..<9 {
    for j in i+1..<9 where A[i] + A[j] == E {
        for k in 0..<9 where k != i && k != j {
            R += "\(A[k])\n"
        }
    }
}
print(R)
