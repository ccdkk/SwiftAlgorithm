//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 12/30/23.
//

import Foundation

// 1074 Z

// [r, c]가 계속 몇 칸에 속했는지를 알면 순서를 알 수 있다.
// 3번쨰 칸에 있다면 2번쨰까지의 2n-1 * 2를 더해주고
// 다시 [r, c]의 위치를 2^(n-1)을 기준으로 찾아주고
// [r, c]와 n승을 계속 넣어주면 될 것 같은데

let nrc = readLine()!.split(separator: " ").map { Int($0)! }
let n = nrc[0], r = nrc[1], c = nrc[2]

func zRecursion(coordinate: [Int], n: Int) -> Int {
    if n == 1 {
        return coordinate[0] * 2 + coordinate[1]
    }
    var newCoordinate = coordinate
    var standard = Int(pow(2.0, Double(n-1)))
    let x = coordinate[0] / standard
    let y = coordinate[1] / standard
    
    var place = 0
    if x == 0 {
        place += 0
    } else {
        place += 2
        newCoordinate[0] -= standard
    }
    
    if y == 0 {
        place += 0
    } else {
        place += 1
        newCoordinate[1] -= standard
    }
    
    return (standard * standard) * place + zRecursion(coordinate: newCoordinate, n: n-1)
}

print(zRecursion(coordinate: [r, c], n: n))

