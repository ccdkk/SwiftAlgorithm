//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 2023/01/01.
//

import Foundation

func solution(_ rsp:String) -> String {
    return rsp.map {
        switch $0 {
        case "2": return "0"
        case "0": return "5"
        case "5": return "2"
        default: return ""
        }
    }.joined()
}
