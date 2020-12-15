//
//  912. Sort an Array.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/11/6.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Stack912 {
    var list: [Int]
    init() {
        list = [Int]()
    }
    func push(_ x: Int) {
        list.append(x)
    }
    func pop() -> Int {
        guard !self.isEmpty() else {
            return -1 // 假设的
        }
        return list.removeLast()
    }
    func peek() -> Int {
        guard !self.isEmpty() else {
            return -1 // 假设的
        }
        return list.last!
    }
    func isEmpty() -> Bool {
        return self.size() == 0
    }
    func size() -> Int {
        return list.count
    }
}

class Solution912 {
    // MARK: - 选择排序：每次找出未排好序的那部分中的最小值
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
    
    func selectionSortWithStack(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        let stack1 = Stack232() // 用来存放未排序的数
        let stack2 = Stack232() // 用来按顺序存放已经排好序的数
        for num in nums {
            stack1.push(num)
        }
        
        var max = -1
        var counter = 0 //记录重复的
        while !stack1.isEmpty() {
            // 遍历stack1找出最大的
            while !stack1.isEmpty() {
                let num = stack1.pop()!
                if num > max {
                    max = num
                    counter = 1
                } else if num == max {
                    counter += 1
                }
                stack2.push(num)
            }
            
            // 过滤掉stack2中已经筛选出来的数，剩下的放回stack1
            while !stack2.isEmpty() && stack2.peek()! <= max {
                if let num = stack2.pop(), num != max {
                    stack1.push(num)
                }
            }
            
            // 将最大的值添加到stack2
            while counter > 0 {
                stack2.push(max)
                counter -= 1
            }
            
            // 清空上一轮结果
            max = -1
            counter = 0
        }
        
        var result = [Int]()
        while !stack2.isEmpty() {
            result.append(stack2.pop()!)
        }
        return result
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
    
    // MARK: - 快速排序，选择数组中的某个数作为基数，通过一趟排序将数组分割成独立的两部分，其中一部分所有数比基数小，另一部分数比基数大，然后再按照同样的方法对两部分数进行排序，循环递归
    func quickSort(_ nums:inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        sort(&nums, 0, nums.count - 1)
    }
    
    func sort(_ nums:inout [Int], _ low: Int, _ high: Int) {
        if low < high {
            // 一趟排序，返回交换后基数的索引
            let pivotIndex = partition(&nums, low, high)
            // 将基数左侧的数按同样的方式排序
            sort(&nums, low, pivotIndex - 1)
            // 将基数右侧的数按同样的方式排序
            sort(&nums, pivotIndex + 1, high)
        }
    }
    
    func partition(_ nums:inout [Int], _ low: Int, _ high: Int) -> Int {
        // 待排序数组的第一个数作为基数
        let pivot = nums[low]
        var i = low + 1
        var j = high
        
        while i < j {
            // 从右往左找第一个小于基数的数
            while nums[j] >= pivot, j > i {
                j -= 1
            }
            
            // 从左往右找第一个大于基数的数
            while nums[i] < pivot, i < j {
                i += 1
            }
            
            nums.swapAt(i, j)
        }
        
        if pivot < nums[i] {
            return low
        } else {
            // 最后小于基数的数在左侧，大于基数的数在右侧
            nums.swapAt(low, i)
            return i
        }
    }
    
    /*
     // 两个挡板，三个区域的解决思路
     class Solution {
         func sortArray(_ nums: [Int]) -> [Int] {
             guard nums.count > 1 else {
                 return nums
             }

             var nums = nums
             quickSort(&nums, 0, nums.count - 1)
             return nums
         }
         
         func quickSort(_ nums: inout [Int], _ low: Int, _ high: Int) {
             if low < high {
                 let pivotIndex = partition(&nums, low, high)
                 quickSort(&nums, low, pivotIndex - 1)
                 quickSort(&nums, pivotIndex + 1, high)
             }
         }
         
         func partition(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {
             let pivot = nums[low]
             var i = low + 1, j = high
             
             while i <= j {
                 if nums[j] >= pivot {
                     j -= 1
                 } else {
                     nums.swapAt(i, j)
                     i += 1
                 }
             }
             nums.swapAt(low, j)
             
             return j
         }
     }
     */
}
