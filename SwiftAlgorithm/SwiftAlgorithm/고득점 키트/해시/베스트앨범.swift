//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/09/01.
//

//MARK: 베스트 앨범
import Foundation
import SwiftUI
//
//
//func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
//    var dict: [String: [Int]] = [:]
//
//    var playList = plays
//    for (index, element) in genres.enumerated() {
//        if var original = dict[element] {
//            original.append(plays[index])
//            dict[element] = original
//        } else {
//            dict[element] = [plays[index]]
//        }
//    }
//
//    let sortedKey = dict.keys.sorted { entry1, entry2 in
//        let sum1 = dict[entry1]!.reduce(0, +)
//        let sum2 = dict[entry2]!.reduce(0, +)
//        return sum1 > sum2
//    }
//
//    var ans = [Int]()
//    for key in sortedKey {
//
//        var value = dict[key]!
//
//        if value.count > 1 {
//            let valueSorted = value.sorted { $0 > $1 }
//            let refiendValue = valueSorted[0...1]
//            let sortedValue = refiendValue.sorted { $0 > $1 }
//            var sortedNumber = sortedValue.map { plays.firstIndex(of: $0)! }
//
//            if sortedValue[0] == sortedValue[1] {
//                var duplicateNumbers: [Int] = []
//                for (index, value) in plays.enumerated() {
//                    if value == sortedValue[0] {
//                        print(value)
//                        duplicateNumbers.append(index)
//                    }
//                }
//                sortedNumber = duplicateNumbers
//            }
//
//            ans += sortedNumber
//        } else {
//            ans += value.map { Int(plays.firstIndex(of: $0)!) }
//        }
//
//    }
//    return ans
//}
//
//print(solution(["classic", "pop", "classic", "classic", "pop"], [800, 600, 150, 800, 2500]))

let dateComponent = DateComponents(year: 2023, month: 8, day: 13)
let date = Calendar.current.date(from: dateComponent)
print(date)
