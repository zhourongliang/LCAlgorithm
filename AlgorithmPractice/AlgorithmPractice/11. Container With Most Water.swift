//
//  11. Container With Most Water.swift
//  AlgorithmPractice
//
//  Created by szxy on 2020/11/3.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution11 {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else {
            return 0
        }

        var l = 0, r = height.count - 1, area = 0
        while l < r {
            let minHeight = min(height[l], height[r])
            let currentArea = minHeight * (r - l)
            if area < currentArea {
                area = currentArea
            }
            
            // 移动矮的
            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }
        return area
    }
}
