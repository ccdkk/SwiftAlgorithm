//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/10/23.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    let sortedCitations = citations.sorted(by: <)
    let reverSortedCitations = citations.sorted(by: >)
    var ans: [Int] = []
    for citation in 0...citations.count {
        let x = citations.count - (sortedCitations.firstIndex { $0 >= citation} ?? citations.count)// h번 이상
//        let y = citations.count - reverSortedCitations.firstIndex(of: citation)!// 이하
        print(sortedCitations, citation, x)
        if x >= citation {
            ans.append(citation)
        }
    }
    return ans.sorted(by: >)[0]
}

print(solution([0, 0, 0]))
