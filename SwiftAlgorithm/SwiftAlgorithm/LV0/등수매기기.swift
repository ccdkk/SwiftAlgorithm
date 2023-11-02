//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/02/10.
//

import Foundation


// Int를 map 해줄때에는
func solution(_ score:[[Int]]) -> [Int] {
    var scoreAverage = score.map { $0[0] + $0[1] }
    var ans = scoreAverage.map { filterdCount(number: $0) }
    
    print(scoreAverage)
    func filterdCount(number: Int) -> Int {
        return scoreAverage.filter { $0 > number }.count + 1
    }
    
    return ans
}

print(solution([[80, 75], [70, 80], [30, 50], [90, 100], [100, 90], [100, 100], [10, 30]]))
