//
//  22. Generate Parentheses.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2021/1/7.
//  Copyright © 2021 szxy. All rights reserved.
//

import Foundation

class Solution22 {
    func generateParenthesis(_ n: Int) -> [String] {
        var valid = ""
        var res = [String]()
        validParenthesis(n, 0, 0, &valid, &res)
        return res
    }
    
    func validParenthesis(_ n: Int, _ l: Int, _ r: Int,_ valid: inout String,_ res: inout [String]) {
        if l == n, r == n {
            res.append(valid)
            return
        }
        
        if (l < n) {
            valid.append("(")
            validParenthesis(n, l + 1, r, &valid, &res)
            valid.removeLast()
        }
        
        if (l > r) {
            valid.append(")")
            validParenthesis(n, l, r + 1, &valid, &res)
            valid.removeLast()
        }
    }
    
    let coins = [25, 10, 5, 1]
    func combinations(_ moneyLeft: Int, _ level: Int, _ result: inout [Int]) {
        if level == coins.count - 1 {
            result[level] = moneyLeft
            print(result)
            return
        }
        
        for i in 0...(moneyLeft / coins[level]) {
            result[level] = i
            combinations(moneyLeft - coins[level] * i, level + 1, &result)
        }
    }
    
    func permutations(_ str: String) -> [String] {
        guard str.count > 0 else {
            return []
        }
        
        let chars = Array(str)
        var out = [Character]()
        var result = [String]()
        var flags = [Bool](repeating: false, count: str.count)
        combinations1(chars, 0, &flags, &out, &result)
        return result
    }
    
    func combinations1(_ chars: [Character], _ level: Int, _ flags: inout [Bool], _ out: inout [Character], _ result: inout [String]) {
        if level == chars.count {
            result.append(String(out))
            return
        }
        
        for i in 0..<chars.count {
            if flags[i] == false {
                out.append(chars[i])
                flags[i] = true
                combinations1(chars, level + 1, &flags, &out, &result)
                flags[i] = false
                out.removeLast()
            }
        }
    }
    
    func removeChars(_ str: String) -> String {
        guard str.count > 0 else {
            return str
        }
        
        var chars = Array(str)
        var i = 0, j = 0
        while j < str.count {
            if chars[j] == "u" || chars[j] == "n" {
                j += 1
            } else {
                chars[i] = chars[j]
                i += 1
                j += 1
            }
        }
        
        return String(chars[0..<i])
    }
    
    func charRemoval(_ str: String) -> String {
        guard str.count > 0 else {
            return str
        }
        
        var chars = Array(str)
        var slow = 0, fast = 0
        var wordsCount = 0
        while true {
            while fast < chars.count, chars[fast] == " " {
                fast += 1
            }
            
            if fast == chars.count {
                break
            }
            
            if wordsCount > 0 {
                chars[slow] = " "
                slow += 1
            }
            
            while fast < chars.count, chars[fast] != " " {
                chars[slow] = chars[fast]
                slow += 1
                fast += 1
            }
            wordsCount += 1
        }
        
        return String(chars[0..<slow])
    }
    
    func removeDuplication(_ str: String) -> String {
        guard str.count > 1 else {
            return str
        }
        
        var chars = Array(str)
        var slow = 1, fast = 1
        while fast < chars.count {
            if chars[fast] == chars[slow - 1] {
                fast += 1
            } else {
                chars[slow] = chars[fast]
                slow += 1
                fast += 1
            }
        }
        
        return String(chars[0..<slow])
    }
    
    func deDuplicate(_ str: String) -> String {
        guard str.count > 1 else {
            return str
        }
        
        var chars = Array(str)
        var slow = 1, fast = 1
        while fast < chars.count {
            if slow == 0 || chars[fast] != chars[slow - 1] {
                chars[slow] = chars[fast]
                slow += 1
                fast += 1
            } else {
                let char = chars[fast]
                fast += 1
                while fast < chars.count, chars[fast] == char {
                    fast += 1
                }
                slow -= 1
            }
        }
//        if slow == 0 {
//            return ""
//        } else {
            return String(chars[0..<slow])
//        }
    }
    
    func stringMatch(_ str1: String, _ str2: String) -> Bool {
        guard str1.count > 0, str2.count > 0,str1.count > str2.count else {
            return false
        }
        
        var chars1 = Array(str1)
        var chars2 = Array(str2)
        for i in 0...(str1.count - str2.count) {
            for j in 0..<str2.count {
                if chars2[j] != chars1[i + j] {
                    break
                }
                if j == str2.count - 1 {
                    return true
                }
            }
        }
        return false
    }
    
    func reverseWords(_ str: String) -> String {
        guard str.count > 1 else {
            return str
        }
        
        var chars = Array(str)
        reverse(&chars, 0, chars.count - 1)
        
        var i = 0, j = 0
        while j < chars.count {
            if chars[j] == " " {
                reverse(&chars, i, j - 1)
                j += 1
                i = j
            } else {
                j += 1
            }
        }
        
        return String(chars)
    }
    
    func reverse(_ chars: inout [Character], _ start: Int, _ end: Int) {
        var low = start, high = end
        while low < high {
            chars.swapAt(low, high)
            low += 1
            high -= 1
        }
    }
}
