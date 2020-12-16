//
//  98. Validate Binary Search Tree.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/12/16.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution98 {
    // MARK: - recursive
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValid(root, Int.min, Int.max)
    }
    
    func isValid(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        guard let root = root else {
            return true
        }
        
        guard root.val > min, root.val < max else {
            return false
        }
        
        return isValid(root.left, min, root.val) && isValid(root.right, root.val, max)
    }
}
