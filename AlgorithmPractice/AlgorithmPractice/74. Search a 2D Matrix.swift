//
//  74. Search a 2D Matrix.swift
//  AlgorithmPractice
//
//  Created by szxy on 2020/11/9.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution74 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 else {
            return false
        }
        let m = matrix.count
        let n = matrix[0].count

        var left = 0, right = m * n - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let row = mid / n
            let col = mid % n

            if matrix[row][col] == target {
                return true
            } else if matrix[row][col] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
}
