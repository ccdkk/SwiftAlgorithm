//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/14/23.
//

import Foundation

let nc = readLine()!.split(separator: " ").map { Int($0)! }
let N = nc[0] // 아이템 개수
let C = nc[1] // 최대 무게 제한
let weights = readLine()!.split(separator: " ").map { Int($0)! }

var sumArray1: [Int] = []
var sumArray2: [Int] = []
var ans = 0

// weights를 반으로 나눠서 각각에서 최대 무게를 넘지 않는 모든 조합을 추출
// 모든 조합의 경우의 수는 각 숫자당 true false 이므로 2의 거듭제곱만큼 나온다.

func dfs(from i: Int, to j: Int, array: inout [Int], weight: Int) {
    // 탈출조건1 무게 제한
    if weight > C {
        return
    }
    
    // 탈출조건2 더이상 판단할 숫자가 없어짐
    // i와 j가 같으면 해당 weight를 array에 넣으며 끝낸다.
    if i == j {
        array.append(weight)
        return
    }
    
    // 이번에 들릴 숫자의 true false 상태에 따라 또 dfs 함수 진행
    dfs(from: i + 1, to: j, array: &array, weight: weight + weights[i])
    dfs(from: i + 1, to: j, array: &array, weight: weight)
}


dfs(from: 0, to: N / 2, array: &sumArray1, weight: 0)
dfs(from: N / 2, to: N, array: &sumArray2, weight: 0)
sumArray1.sort()


// 정렬된 숫자 사이에서 최댓값 or 최솟값을 찾을 때 이분 탐색 활용 가능
func binarySearchUpperbound(_ array: [Int], _ target: Int) -> Int {
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] > target {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return start
}

for sum in sumArray2 {
    ans += binarySearchUpperbound(sumArray1, C - sum)
}
print(ans)
