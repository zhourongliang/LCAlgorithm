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
}
