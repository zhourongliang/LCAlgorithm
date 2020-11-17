//
//  167. Two Sum II - Input array is sorted.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/11/17.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution167 {
    // 核心要抓住有序
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count > 1 else {
            return []
        }
        
        var leftIndex = 0
        var rightIndex = numbers.count - 1
        
        while leftIndex < rightIndex {
            if numbers[leftIndex] + numbers[rightIndex] == target {
                return [leftIndex + 1, rightIndex + 1]
            } else if numbers[leftIndex] + numbers[rightIndex] < target {
                leftIndex += 1
            } else {
                rightIndex -= 1
            }
        }
        
        return []
    }
}
