//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/12.
//

import Foundation

func solution(_ n:Int) -> [Int] {
    // 소수의 리스트?
    // 소수를 일단 구해야지?
    // 약수의 곱으로 표현하고 약수를 계속 분해해 소수가 나올 떄 까지
    // 약수의 개수가 3개 이상이면 약수의 곱으로 표현
    // 재귀
    // 최종으로 소수만 나오게 됨.
    var ans: Set<Int> = []
    
    func factorization(_ n: Int) -> Int {
        let factors = (1...n).filter { n % $0 == 0 }
        if factors.count == 2 {
            ans.insert(n)
            return n
        }
        
        if (1...factors[1]).filter { factors[1] % $0 == 0 }.count == 2 {
            ans.insert(factors[1])
        }
        
        return factors[1] * factorization(n / factors[1])
    }
    
    factorization(n)
    return Array(ans).sorted()
}
// 문제가 요구하는건 단지 n을 나눌 수 있는 모든 소수를 구하라는 것이므로,
// 나의 풀이는 소인수 분해 자체를 구하여 중복을 제거한 것이므로 오버엔지니어링이다.
// 단지 나눌 수 있는 소수를 찾는 것은 solution1의 방법이 적절한 것 같다.

func solution1(_ n:Int) -> [Int] {
    
    var n = n
    var answer: [Int] = []
    for div in (2...n) {
        while n % div == 0 {
            n /= div
            if !answer.contains(div) {
                answer.append(div)
            }
        }
    }

    return answer
}

print(solution(39))
