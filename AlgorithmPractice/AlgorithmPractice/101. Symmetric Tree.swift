//
//  101. Symmetric Tree.swift
//  AlgorithmPractice
//
//  Created by zhourl on 2020/12/15.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution101 {
    // MARK: - recursive
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil else {
            return true
        }
        
        return isNodesEqual(root?.left, root?.right)
    }
    
    func isNodesEqual(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil, right == nil {
            return true
        } else if left == nil || right == nil {
            return false
        } else if left!.val != right!.val {
            return false
        }
        
        return isNodesEqual(left?.left, right?.right) && isNodesEqual(left?.right, right?.left)
    }
    
    // MARK: - Iterative 待实现
}
