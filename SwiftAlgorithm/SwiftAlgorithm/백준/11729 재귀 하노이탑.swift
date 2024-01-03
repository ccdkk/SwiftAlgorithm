//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 12/30/23.
//

import Foundation

// n개를 a에서 b로 옮기는 경우
// 1. n-1개를 a에서 6-a-b로 옮겨야 한다.
// 2. n번쨀ㄹ을 a에서 b로 옮긴다.
// 3. n-1개를 6-a-b에서 b로 옮긴다.
let K = Int(readLine()!)!
print(pow(2, K) - 1)
func hanoiRecursion(from startPoint: Int, to endPoint: Int, n: Int) {
    if n == 1 {
        print("\(startPoint) \(endPoint)")
        return
    }
    hanoiRecursion(from: startPoint, to: 6 - startPoint - endPoint, n: n-1)
    print("\(startPoint) \(endPoint)")
    hanoiRecursion(from: 6 - startPoint - endPoint, to: endPoint, n: n-1)
}

hanoiRecursion(from: 1, to: 3, n: K)
