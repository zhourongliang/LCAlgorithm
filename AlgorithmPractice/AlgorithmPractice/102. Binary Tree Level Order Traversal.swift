//
//  102. Binary Tree Level Order Traversal.swift
//  AlgorithmPractice
//
//  Created by szxy on 2020/12/29.
//  Copyright © 2020 szxy. All rights reserved.
//

import Foundation

class Solution102 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }

        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)

        while !queue.isEmpty {
            let size = queue.count
            var temp = [Int]()

            for _ in 0..<size {
                let node = queue.removeFirst()
                temp.append(node.val)
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
            }
            result.append(temp)
        }

        return result
    }
}
