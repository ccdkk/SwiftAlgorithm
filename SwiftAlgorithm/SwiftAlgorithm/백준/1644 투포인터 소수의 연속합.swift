//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/14/23.
//

import Foundation

let N = Int(readLine()!)!
var nums = Array(repeating: 0, count: N + 1)

if N == 1 { // N의 범위가 1...4000000 이므로 1일 때 예외 처리를 해줘야 함. 앞으로 이런 문제 풀때 N의 최소 최대 범위를 확인하고 for문의 범위와 잘 확인하여 풀어야겠다.
    print(0)
} else {
    for i in 2...N {
        nums[i] = i
    }
    
    
    //에라토스 테네스의 체
    for i in 2...N {
        // 이미 제외된 친구라면 실행하지 않음. 이미 제외됐다면 그 친구의 배수는 이미 제외됐음
        if nums[i] == 0 {
            continue
        }
        
        // 소수인 자기는 남기고 나머지를 제외해나감
        for j in stride(from: i+i, through: N, by: i) {
            nums[j] = 0
        }
    }

    var primeNumbers = [0] + nums.filter { $0 != 0 }
    for i in 1..<primeNumbers.count {
        primeNumbers[i] += primeNumbers[i-1]
    }

    //투 포인터
    var start = 0
    var end = 1
    var ans = 0
    while start < primeNumbers.count && end < primeNumbers.count {
        let sum = primeNumbers[end] - primeNumbers[start]
        if sum > N {
            start += 1
        } else if sum < N {
            end += 1
        } else {
            ans += 1
            end += 1
        }
    }

    print(ans)
}
