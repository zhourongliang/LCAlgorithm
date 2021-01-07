//
//  78. Subsets.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2021/1/7.
//  Copyright © 2021 szxy. All rights reserved.
//

import Foundation

class Solution78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var subset = [Int]()
        permutation(nums, 0, &subset, &res)
        return res
    }
    
    func permutation(_ nums: [Int], _ index: Int,_ subset: inout [Int],_ res: inout [[Int]]) {
        if nums.count == index {
            res.append(subset)
            return
        }
        
        subset.append(nums[index])
        permutation(nums, index + 1, &subset, &res)
        subset.removeLast()
        
        permutation(nums, index + 1, &subset, &res)
    }
}
