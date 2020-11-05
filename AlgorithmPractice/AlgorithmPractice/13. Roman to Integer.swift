//
//  13. Roman to Integer.swift
//  AlgorithmPractice
//
//  Created by szxy on 2020/11/5.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution13 {
    let map = ["I": 1,
               "V": 5,
               "X": 10,
               "L": 50,
               "C": 100,
               "D": 500,
               "M": 1000]
    
    func romanToInt(_ s: String) -> Int {
        // 以下是将字符串转成单个的字符串数组，从map中取值不需要再转化，同时熟悉String的map的用法
        let s = s.map{ "\($0)" }
        var total = 0, i = 0
        while i < s.count {
            if i + 1 < s.count && map[s[i]]! < map[s[i + 1]]! {
                total += (map[s[i + 1]]! - map[s[i]]!)
                i += 2
                continue
            }
            
            total += map[s[i]]!
            i += 1
        }
        return total
        
        // 以下是将字符串转成字符数组
//        let chars = Array(s)
//        var total = 0, i = 0
//        while i < s.count {
//            if i + 1 < s.count && map[String(chars[i])]! < map[String(chars[i + 1])]! {
//                total += (map[String(chars[i + 1])]! - map[String(chars[i])]!)
//                i += 2
//            } else {
//                total += map[String(chars[i])]!
//                i += 1
//            }
//        }
//        return total
    }
}
