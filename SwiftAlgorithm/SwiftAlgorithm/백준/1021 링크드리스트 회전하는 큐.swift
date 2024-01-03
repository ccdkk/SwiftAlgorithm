//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/22/23.
//

import Foundation

class Node {
    var data: Int
    var prev: Node?
    var next: Node?
    
    init(data: Int, prev: Node? = nil, next: Node? = nil) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}

struct LinkedList {
    var head: Node?
    var tail: Node?
    
    mutating func append(data: Int) {
        if head == nil {
            let newNode = Node(data: data)
            head = newNode
            tail = newNode
            return
        }
        let newNode = Node(data: data)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    mutating func removeFirst() {
        if head == nil {
            return
        }
        
        if head?.next == nil {
            head = nil
            return
        }
        // 헤드를 현재 헤드의 next로 바꿈. next의 prev를 삭제함
        head?.next?.prev = nil
        head = head?.next
    }
    
    mutating func moveLeft() {
        if head == nil {
            return
        }
        tail?.next = head
        head?.prev = tail
        tail = head
        
        head?.next?.prev = nil
        head = head?.next
    }
    
    mutating func moveRight() {
        if tail == nil {
            return
        }
        head?.prev = tail
        tail?.next = head
        head = tail
        
        tail?.prev?.next = nil
        tail = tail?.prev
    }
    
    mutating func searchData(with data: Int) -> Int {
        if head == nil {
            return 0
        }
        
        if head?.data == data {
            removeFirst()
            return 0
        }
        
        var startFromStart = 0
        var startFromBack = 0
        var node1 = head
        while node1?.data != data {
            startFromStart += 1
            node1 = node1?.next
        }
        var node2 = tail
        while node2?.data != data {
            startFromBack += 1
            node2 = node2?.prev
        }
        
        if startFromStart > startFromBack+1 {
            for _ in 0..<startFromStart {
                moveLeft()
            }
            removeFirst()
        } else {
            for _ in 0..<startFromBack+1 {
                moveRight()
            }
            removeFirst()
        }
        return min(startFromBack+1, startFromStart)
    }
}

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var linkedList = LinkedList()
var ans = 0
for i in 1...N {
    linkedList.append(data: i)
}
for num in nums {
    ans += linkedList.searchData(with: num)
}
print(ans)
