//
//  VerticalLineCommand.swift
//  
//
//  Created by 朱浩宇 on 2023/5/28.
//

import Foundation
import Cocoa

struct VerticalLineCommand: DrawCommand {
    static let identifier: String = "V"

    let x: Double

    init(values: [Double]) {
        x = values[0]
    }

    func applyToNSBezierPath(path: NSBezierPath) {
        path.line(to: NSPoint(x: x, y: path.currentPoint.y))
    }
}
