//
//  206. Reverse Linked List.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/11/13.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution206 {
    func reverseListIteratively(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var prev: ListNode?
        var cur = head
        
        while cur != nil {
            let nextNode = cur?.next
            cur?.next = prev // 反转
            prev = cur // 往前移一步
            cur = nextNode
        }
        
        return prev
    }
    
    func reverseListRecursively(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let newHead = reverseListRecursively(head?.next)
        head?.next?.next = head
        head?.next = nil
        
        return newHead
    }
}
