//
//  1. Two Sum.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/11/16.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for index in 0..<nums.count {
            let value = nums[index]
            let remainder = target - value
            
            if let matchIndex = dict[remainder] {
                return [matchIndex, index]
            } else {
                dict[value] = index
            }
        }
        
        return [-1, -1]
    }
}
