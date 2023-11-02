//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/19.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    var condition = (2...a).filter { a % $0 == 0 && b % $0 == 0}
    var acopy = a
    var bcopy = b
    while condition.count > 1 {
        if acopy ==1 {
            break
        }
        acopy /= condition.first!
        bcopy /= condition.first!
        condition = (2...acopy).filter { acopy % $0 == 0 && bcopy % $0 == 0}
    }
    
    var ans: [Int] = []
    
    func factorization(_ n: Int) -> Int {
        let factors = (1...n).filter { n % $0 == 0 }
        if factors.count == 2 {
            ans.append(n)
            return n
        }
        
        if (1...factors[1]).filter { factors[1] % $0 == 0 }.count == 2 {
            ans.append(factors[1])
        }
        
        return factors[1] * factorization(n / factors[1])
    }
    factorization(bcopy)
    
    return ans.allSatisfy { $0 == 2 || $0 == 5 } ? 1 : 2
}

print(solution(11, 22))
