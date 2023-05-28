//
//  RelativeMoveCommand.swift
//  
//
//  Created by 朱浩宇 on 2023/5/28.
//

import Foundation
import Cocoa

struct RelativeMoveCommand: DrawCommand {
    static let identifier: String = "m"
    let x: Double
    let y: Double

    init(values: [Double]) {
        x = values[0]
        y = values[1]
    }

    func applyToNSBezierPath(path: NSBezierPath) {
        path.relativeMove(to: NSPoint(x: x, y: y))
    }
}
