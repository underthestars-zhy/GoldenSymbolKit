//
//  NSRect.swift
//  
//
//  Created by 朱浩宇 on 2023/5/29.
//

import Foundation

extension NSRect {
    var center : CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}
