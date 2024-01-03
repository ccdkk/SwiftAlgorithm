//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 최동권 on 11/13/23.
//

import Foundation

struct Heap<T: Comparable> {
    var heap = Array<T>()
    
    init() {}

    mutating func insert(_ data: T) {
        if heap.isEmpty {
            heap.append(data)
            heap.append(data)
            return
        }
        
        heap.append(data)
        
        func isMoveUp(insertIndex: Int) -> Bool {
            if insertIndex <= 1 { // RootNode일 때
                return false
            }
            let parentIndex = insertIndex / 2
            return heap[parentIndex] > heap[insertIndex]
        }
        
        var insertIndex = heap.count - 1
        while isMoveUp(insertIndex: insertIndex) {
            let parentIndex = insertIndex / 2
            heap.swapAt(parentIndex, insertIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus {
        case left
        case right
        case none
    }
    
    mutating func pop() -> T? {
        
        if heap.count <= 1 {
            return nil
        }
        let swappedIndex = heap.count - 1
        heap.swapAt(1, swappedIndex)
        
        let minData = heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            
            let leftIndex = poppedIndex * 2
            let rightIndex = leftIndex + 1
            
            // 자식이 없는 경우
            if leftIndex > heap.count - 1 {
                return .none
            }
            // 왼쪽 자식만 있다.
            if rightIndex > heap.count - 1 {
                return heap[leftIndex] < heap[poppedIndex] ? .left : .none
            }
            
            // 아래로는 자식이 두개인 경우
            // 두 자식이 모두 큰 경우
            if (heap[leftIndex] > heap[poppedIndex]) && (heap[rightIndex] > heap[poppedIndex]) {
                return .none
            }
            
            // 두 자식이 다 있고 둘다 작은 경우
            if (heap[leftIndex] < heap[poppedIndex]) && (heap[rightIndex] < heap[poppedIndex]) {
                return heap[leftIndex] < heap[rightIndex] ? .left : .right
            }
            
            // 자식중 한 자식만 작은 경우
            if (heap[leftIndex] < heap[poppedIndex]) || (heap[rightIndex] < heap[poppedIndex]) {
                return heap[leftIndex] < heap[rightIndex] ? .left : .right
            }
            
            return .none
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return minData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = poppedIndex * 2 + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
            }
        }
    }
}

let N = Int(readLine()!)!
var heap = Heap<Int>()

for _ in 0..<N {
    let input = Int(readLine()!)!
    
    if input == 0 {
        if let min = heap.pop() {
            print(min)
        } else {
            print(0)
        }
    } else {
        heap.insert(input)
    }
}
