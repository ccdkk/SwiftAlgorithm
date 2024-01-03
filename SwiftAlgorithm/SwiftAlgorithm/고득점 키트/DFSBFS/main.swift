//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/24/23.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var graph: [String: [String]] = [:]
    var visitedCountry: [String: [String]] = [:]
    var result: [String] = []
    for ticket in tickets {
        if let data = graph[ticket[0]] {
            var newData = data
            newData.append(ticket[1])
            graph[ticket[0]] = newData
        } else {
            graph[ticket[0]] = [ticket[1]]
            visitedCountry[ticket[0]] = []
        }
    }
    
    func DFS(start: String) {
        result.append(start)
        if let connectedCountries = graph[start] {
            for country in connectedCountries.sorted() {
                if let countries = visitedCountry[start] {
                    if !countries.contains(country) {
                        visitedCountry[start]! += [country]
                        DFS(start: country)
                    } else if countries.filter { $0 == country}.count < graph[start]!.filter { $0 == country }.count {
                        visitedCountry[start]! += [country]
                        DFS(start: country)
                    }
                } else {
                    result.append(country)
                }
            }
        }
    }
    
    DFS(start: "ICN")
    return result
}

func solution1(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted { $0[1] < $1[1] }
    var visited = [Bool](repeating: false, count: tickets.count)
    
    var result: [String] = []
    
    func dfs(start: String) {
        // 현재 방문한 도시 수가 티켓 수와 같다면 지금 도착한 곳이 마지막 여행지
        if result.count == tickets.count {
            result.append(start)
            return
        }
        
        
        for i in 0..<tickets.count {
            if tickets[i][0] == start && !visited[i] {
                visited[i] = true
                result.append(start)
                dfs(start: tickets[i][1])
                // 모든 도시를 방문했으면 종료
                if result.count == tickets.count + 1 {
                    return
                }
                // 해당 경로로 모든 도시를 방문할 수 없다면 취소하고 다른 도시를 방문
                result.removeLast()
                visited[i] = false
            }
        }
    }
    
    dfs(start: "ICN")
    return result
}

print(solution1([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
