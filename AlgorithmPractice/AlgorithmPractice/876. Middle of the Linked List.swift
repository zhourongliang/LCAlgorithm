//
//  876. Middle of the Linked List.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/12/8.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution876 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head != nil, head?.next != nil else {
            return head
        }
        
        var slow = head
        var fast = head
        while fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        if fast?.next != nil {
            return slow?.next
        } else {
            return slow
        }
    }
}
