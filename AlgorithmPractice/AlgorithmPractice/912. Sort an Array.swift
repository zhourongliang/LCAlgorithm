//
//  912. Sort an Array.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/11/6.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution912 {
    func selectionSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        var nums = nums
        var minIndex = 0
        for i in 0..<(nums.count - 1) {
            minIndex = i
            for j in (i + 1)..<nums.count {
                if nums[j] < nums[minIndex] {
                    minIndex = j
                }
            }
            if minIndex != i {
                nums.swapAt(i, minIndex)
            }
        }
        return nums
    }
}
