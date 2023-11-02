//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 10/19/23.
//

import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var houseCoordinates: [Int] = []
for _ in 1...input[0] {
    houseCoordinates.append(Int(readLine()!)!)
}
// 2110 공유기설치 이진검색
// 거리를 기준으로 이분 탐색
let sortedHouses = houseCoordinates.sorted()
let first = sortedHouses[0]
var start = 1
var end = sortedHouses[sortedHouses.count - 1] - sortedHouses[0]
var result = 0

// 조건을 만족하는 공유기 간의 최대 길이!를 찾아가는 과정
// 첫값으로 최소 최대 크기를 지정한다 start, end
// 그리고 그 범위 내에서 조건을 만족하는 길이를 찾아 나간다.
while start <= end {
    // 설치할 수 있는 공유기 개수
    var count = 1
    let mid = (start + end) / 2
    var preHome = first
    for i in 1..<input[0] {
        let currentHome = sortedHouses[i]
        if currentHome - preHome >= mid {
            count += 1
            preHome = currentHome
        }
    }
    
    print(sortedHouses, "mid:",mid, "start:", start, "end:", end, "count:", count)
    if count < input[1] {
        // 공유기가 적으면 mid를 줄여야한다. 그러면 end를 mid보다 작게 설정하여 길이를 줄여야 한다.
        end = mid - 1
    } else {
        // 공유기가 많다면 mid를 늘려야한다. 그러면 start를 mid보다 크게 설정하여 길이를 늘린다.
        start = mid + 1
        result = mid
    }
}

print(result)
