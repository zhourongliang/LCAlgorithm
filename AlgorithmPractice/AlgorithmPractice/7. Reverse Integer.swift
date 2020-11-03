//
//  7. Reverse Integer.swift
//  AlgorithmPractice
//
//  Created by szxy on 2020/11/3.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution7 {
    func reverse(_ x: Int) -> Int {
        var num = x
        var result = 0
        while num != 0 {
            result = result * 10 + num % 10
            num = num / 10
            if result > Int32.max || result < Int32.min {
                return 0
            }
        }
        return result
    }
}
