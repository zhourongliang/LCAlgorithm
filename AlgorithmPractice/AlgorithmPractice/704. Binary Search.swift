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
    
    // MARK: - 二维的二叉搜索,见 74.Search a 2D Matrix
    
    // MARK: - 变种1
    // how to find an element in the array that is closest to the target number?
    func search1(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
                return -1
            }

        var left = 0, right = nums.count
        // 提前一步停下来，找到相邻的两个数
        while left < right - 1 {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid
            } else {
                right = mid
            }
        }

        // 后期处理
        if abs(nums[left] - target) <= abs(nums[right] - target) {
            return left
        } else {
            return right
        }
    }
    
    // MARK: - 变种2
    // return the index of the first occurrence of an element? (4,5,5,5,5,5,5) 5
    func search2(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return -1
        }

        var left = 0, right = nums.count - 1
        // 提前停下来的原因：用实例来检测，如果不提前停下来，可能出现死循环
        while left < right - 1 {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                right = mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        // check
        if nums[left] == target {
            return left
        }
        
        if nums[right] == target {
            return right
        }
            
        return -1
    }
    
    // MARK: - 变种3
    // how to find k elements in the array that is closest to the target number?
    func search3(_ nums: [Int], _ target: Int, _ k: Int) -> [Int] {
        guard k > 0, nums.count > k  else {
            return []
        }

        var left = 0, right = nums.count - 1
        while left < right - 1 {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                right = mid
            } else if nums[mid] < target {
                left = mid
            } else {
                right = mid
            }
        }

        var result = [Int]()
        for _ in 0..<k {
            if left < 0 {
                result.append(nums[right])
                right += 1
            } else if right >= nums.count {
                result.append(nums[left])
                left -= 1
            } else {
                if abs(nums[left] - target) <= abs(nums[right] - target) {
                    result.append(nums[left])
                    left -= 1
                } else {
                    result.append(nums[right])
                    right += 1
                }
            }
        }
        return result
    }
    
    // MARK: - 变种4
    // Given a sorted Dictonary with unknown size, how to determine whether a word is in the Dictionary or not?
}
