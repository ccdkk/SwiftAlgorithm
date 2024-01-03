//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/22/23.
//

import Foundation

class Node {
    var index: Int
    var data: Int
    var prev: Node?
    var next: Node?
    
    init(index: Int, data: Int, prev: Node? = nil, next: Node? = nil) {
        self.index = index
        self.data = data
        self.prev = prev
        self.next = next
    }
}

struct LinkedList {
    var head: Node?
    var tail: Node?
    var lastBoom: Node?
    
    mutating func append(data: Int, index: Int) {
        let newNode = Node(index: index+1, data: data)
        if head == nil {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    mutating func boom(count: Int) -> [Int]? {
        if count > 0 {
            for _ in 0..<count-1 {
                moveRight()
            }
        } else {
            for _ in 0..<abs(count) {
                moveLeft()
            }
        }
        return removeFirst()
    }
    
    mutating func removeFirst() -> [Int]? {
        if head == nil {
            return nil
        }
        let removedHead = head
        head?.next?.prev = nil
        head = head?.next
        return [removedHead!.data, removedHead!.index]
    }
    
    mutating func moveRight() {
        if head == nil {
            return
        }
        // 헤드를 테일로 옮기는 작업
        
        tail?.next = head
        head?.prev = tail
        tail = head
        head?.next?.prev = nil
        head = head?.next
        tail?.next = nil
    }
    mutating func moveLeft() {
        if tail == nil {
            return
        }
        // 테일을 헤드로 옮기는 작업
        head?.prev = tail
        tail?.next = head
        head = tail
        tail?.prev?.next = nil
        tail = tail?.prev
        head?.prev = nil
    }
}

let N = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var ans: [Int] = []
var linkedList = LinkedList()
var boomCount = 0
for i in 0..<N {
    linkedList.append(data: nums[i], index: i)
}

for _ in 0..<N {
    if let removedData = linkedList.boom(count: boomCount) {
        boomCount = removedData[0]
        ans.append(removedData[1])
    }
}
print(ans.map { String($0) }.joined(separator: " "))
