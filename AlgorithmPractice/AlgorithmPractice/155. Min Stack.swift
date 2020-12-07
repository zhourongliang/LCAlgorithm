//
//  155. Min Stack.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/12/7.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class MinStack155 {
    
    var list: [Int]
    var temp: [Int]
    
    /** initialize your data structure here. */
    init() {
        list = [Int]()
        temp = [Int]()
    }
    
    func push(_ x: Int) {
        list.append(x)
        if let min = temp.last {
            if (x < min) {
                temp.append(x)
            } else {
                temp.append(min)
            }
        } else {
            temp.append(x)
        }
    }
    
    func pop() {
        list.removeLast()
        temp.removeLast()
    }
    
    func top() -> Int {
        guard list.count > 0 else {
            return -1
        }
        
        return list.last!
    }
    
    func getMin() -> Int {
        guard temp.count > 0 else {
            return -1
        }
        
        return temp.last!
    }
}
