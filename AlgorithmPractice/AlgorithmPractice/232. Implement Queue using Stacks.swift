//
//  232. Implement Queue using Stacks.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/12/7.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Stack232 {
    var list: [Int]
    
    init() {
        list = [Int]()
    }
    
    func push(_ x: Int) {
        list.append(x)
    }
    
    func pop() -> Int? {
        if self.isEmpty() {
            return 0
        }
        return list.removeLast()
    }
    
    func peek() -> Int? {
        return list.last
    }
    
    func size() -> Int {
        return list.count
    }
    
    func isEmpty() -> Bool {
        return self.size() == 0
    }
}

class MyQueue232 {
    
    var inStack: Stack232
    var outStack: Stack232
    
    /** Initialize your data structure here. */
    init() {
        inStack = Stack232()
        outStack = Stack232()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        inStack.push(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if !outStack.isEmpty() {
            return outStack.pop()!
        }
        
        if inStack.isEmpty() {
            return 0
        }
        
        while !inStack.isEmpty() {
            outStack.push(inStack.pop()!)
        }
        
        return outStack.pop()!
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if !outStack.isEmpty() {
            return outStack.peek()!
        }
        
        if inStack.isEmpty() {
            return 0
        }
        
        while !inStack.isEmpty() {
            outStack.push(inStack.pop()!)
        }
        
        return outStack.peek()!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return inStack.isEmpty() && outStack.isEmpty()
    }
}
