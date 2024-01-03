//
//  소수 찾기.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/17/23.
//

import Foundation

func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num <= 1 ? false : true
    } else {
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 {
                return false
            }
        }
    }
    
    return true
}

func solution(_ numbers: String) -> Int {
    let nums: [String] = numbers.map { String($0) }
    // 해당 숫자를 들렸는지의 여부
    var visited: [Bool] = [Bool](repeating: false, count: nums.count)
    var numSet: Set<Int> = []
    
    func permutation(_ numArr: [String], count: Int, rCount: Int) {
        // count는 현재 자릿수, rCount는 목표 자리수, numArr는 지금까지 만든 순열
        // 목표 자리수에 도달하면 return
        if count == rCount {
            numSet.insert(Int(numArr.joined())!)
        }
        
        // 숫자 구성 각각 하나씩 만들어주는 과정
        // ["2", "3", "5"] -> 235 로 변환해줘야함
        for (i, n) in nums.enumerated() {
            // 이미 사용한 숫자라면 그냥 통과한다.
            // [1,2,3] 으로 구성하는데 122가 되는 경우 배제
            if visited[i] {
                continue
            }
            
            var newNumArr = numArr
            newNumArr.append(n)
            visited[i] = true
            // 숫자 하나의 array를 만들기 위해 재귀 사용
            permutation(newNumArr, count: count + 1, rCount: rCount)
            // 다 만들고 나면 사용하지 않음으로 다시 바꿔줌
            visited[i] = false
        }
    }
    
    // 한자리, 두자리, 세자리 ... 순의 모든 순열을 구한다.
    for i in 1...nums.count {
        permutation([], count: 0, rCount: i)
    }
    
    return numSet.filter { isPrime($0) }.count
}



func solution1(_ numbers: String) -> [Int] {
    let nums: [String] = numbers.map { String($0) }
    // 해당 숫자를 들렸는지의 여부
    var visited: [Bool] = [Bool](repeating: false, count: nums.count)
    var numSet: Set<Int> = []
    
    func permutation(_ numArr: [String], count: Int, rCount: Int) {
        // count는 현재 자릿수, rCount는 목표 자리수, numArr는 지금까지 만든 순열
        // 목표 자리수에 도달하면 return
        if count == rCount {
            numSet.insert(Int(numArr.joined())!)
        }
        
        // 숫자 구성 각각 하나씩 만들어주는 과정
        // ["2", "3", "5"] -> 235 로 변환해줘야함
        for (i, n) in nums.enumerated() {
            // 이미 사용한 숫자라면 그냥 통과한다.
            // [1,2,3] 으로 구성하는데 122가 되는 경우 배제
            if visited[i] {
                continue
            }
            
            var newNumArr = numArr
            newNumArr.append(n)
            visited[i] = true
            // 숫자 하나의 array를 만들기 위해 재귀 사용
            permutation(newNumArr, count: count + 1, rCount: rCount)
            // 다 만들고 나면 사용하지 않음으로 다시 바꿔줌
            visited[i] = false
        }
    }
    
    // 한자리, 두자리, 세자리 ... 순의 모든 순열을 구한다.
    for i in 1...nums.count {
        permutation([], count: 0, rCount: i)
    }
    
    return Array(numSet)
}
