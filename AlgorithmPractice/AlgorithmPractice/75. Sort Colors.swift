//
//  75. Sort Colors.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/11/25.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution75 {
    // 由quickSort引申出的经典的挡板问题
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        /*
         i = 0, i的左侧不包含i,全为0
         k = n - 1, k的右侧不包含k,全为2
         j = 0, j是当前的索引，i和j之间全为1,[i, j)
         
         [j, k]为未知区域
         */
        var i = 0, j = 0, k = nums.count - 1
        while j <= k {
            if nums[j] == 0 {
                nums.swapAt(i, j)
                i += 1
                j += 1
            } else if nums[j] == 1 {
                j += 1
            } else {
                nums.swapAt(j, k)
                k -= 1
            }
        }
    }
}
