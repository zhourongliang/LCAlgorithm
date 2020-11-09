//
//  704. Binary Search.swift
//  AlgorithmPractice
//
//  Created by szxy on 2020/11/9.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution704 {
    // 经典的二叉搜索
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        var left = 0, right = nums.count - 1
        // 不确定条件是 < 或者 <= 时，用单个元素的数组来判断
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1 // 二分查找的关键是每次去除确定不包含的那一半，利用此思路来决定写代码的时候需要或者不需要 +1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
    
    // 变种1，二维的二叉搜索,见 74.Search a 2D Matrix
}
