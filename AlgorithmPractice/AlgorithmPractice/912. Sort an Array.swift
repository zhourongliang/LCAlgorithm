//
//  912. Sort an Array.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/11/6.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution912 {
    // MARK: -选择排序：每次找出未排好序的那部分中的最小值
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
    
    // MARK: - 归并排序：理解递归
    func mergeSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums // base case
        }
        
        let mid = nums.count / 2
        // 前边一半排好，后边一半排好
        let left = mergeSort(Array(nums[0..<mid]))
        let right = mergeSort(Array(nums[mid..<nums.count]))
        
        // 将排好序的部分再排好
        return merge(left, right)
    }
    
    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        // 关键点：每个部分都已经是有序的了
        var leftIndex = 0, rightIndex = 0
        var sortedArray = [Int]()
        
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                sortedArray.append(left[leftIndex])
                leftIndex += 1
            } else if left[leftIndex] > right[rightIndex] {
                sortedArray.append(right[rightIndex])
                rightIndex += 1
            } else {
                sortedArray.append(left[leftIndex])
                leftIndex += 1
                sortedArray.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            sortedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            sortedArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return sortedArray
    }
    
    // MARK: - 冒泡排序: 每一轮都是两两对比
    func bubbleSort(_ nums:inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        for i in 0..<(nums.count - 1) {
            for j in 0..<(nums.count - 1 - i) {
                if nums[j] > nums[j + 1] {
                    nums.swapAt(j, j + 1)
                }
            }
        }
    }
    
    // MARK: - 插入排序，构建有序数组，未排序的数据，在已排序的序列中从后向前扫描，并找到她的位置进行插入
    func insertionSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var nums = nums
        var preIndex: Int
        var cur: Int
        for i in 1..<nums.count {
            preIndex = i - 1
            cur = nums[i]
            while preIndex >= 0, nums[preIndex] > cur {
                nums[preIndex + 1] = nums[preIndex]
                preIndex -= 1
            }
            nums[preIndex + 1] = cur
        }
        
        return nums
    }
}
