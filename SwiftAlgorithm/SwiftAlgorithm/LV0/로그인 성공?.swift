//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/17.
//

import Foundation

func solution(_ id_pw:[String], _ db:[[String]]) -> String {
    var ids = db.map { $0[0] }
    
    print(Dictionary(uniqueKeysWithValues: db.map { ($0[0], $0[1])}))
    
    if db.contains(id_pw) {
        return "login"
    } else if ids.contains(id_pw[0]) {
        return "wrong pw"
    } else {
        return "fail"
    }
}

// dictionary로 접근한 풀이
func solution1(_ idPw: [String], _ db: [[String]]) -> String {
    if let pw = Dictionary(uniqueKeysWithValues: db.map { ($0[0], $0[1]) })[idPw[0]] {
        return pw == idPw[1] ? "login" : "wrong pw"
    } else {
        return "fail"
    }
}
