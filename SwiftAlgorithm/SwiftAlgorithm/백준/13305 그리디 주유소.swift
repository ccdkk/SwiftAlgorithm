//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/10/23.
//

import Foundation

let N = Int(readLine()!)!
let longs = readLine()!.split(separator: " ").map { Int($0)! }
var prices = readLine()!.split(separator: " ").map { Int($0)! }
prices.removeLast()
var lowPrice = prices[0]
var ans = 0
//내 price보다 싼게 나올 때 까지는 내 것으로 달려야 한다.

for (i, price) in prices.enumerated() {
    lowPrice = min(lowPrice, price)
    ans += lowPrice * longs[i]
}
print(ans)
