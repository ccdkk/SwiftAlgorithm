//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 1/1/24.
//

import Foundation

// 내방식 중복을 제거하는 방식
//let NM = readLine()!.split(separator: " ").map { Int($0)! }
//let n = NM[0], m = NM[1]
//var isUsed = [Bool](repeating: false, count: n)
//var numsGroup = [[Int]]()
//
//func backTracking(count: Int, curNums: [Int]) {
//    if count == m {
//        let sortedNum = curNums.sorted()
//        if numsGroup.contains(sortedNum) {
//            return
//        } else {
//            numsGroup.append(sortedNum)
//            print(curNums.map { String($0) }.joined(separator: " "))
//        }
//        return
//    }
//    
//    for i in 0..<n {
//        if !isUsed[i] {
//            var newNums = curNums
//            newNums.append(i + 1)
//            isUsed[i] = true
//            backTracking(count: count + 1, curNums: newNums)
//            isUsed[i] = false
//        }
//    }
//}
// backTracking(count: 0, curNums: [])
// 내가 하고 싶던 것
let input = readLine()!.split(separator: " ").compactMap { Int($0) }
   let N = input[0]
   let M = input[1]
   let permutation = Array(1...N)
   
   func findPermutation(k: Int, s: Int, arr: [Int]) {
       if k == M {
           print(arr.map { String($0) }.joined(separator: " "))
           return
       }

       for i in s..<N {
           var newArr = arr
           newArr.append(permutation[i])
           findPermutation(k: k + 1, s: i + 1, arr: newArr)
       }
   }
   
   findPermutation(k: 0, s: 0, arr: [])

