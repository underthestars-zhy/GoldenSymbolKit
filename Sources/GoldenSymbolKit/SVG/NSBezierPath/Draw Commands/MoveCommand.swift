//
//  MoveCommand.swift
//  
//
//  Created by 朱浩宇 on 2023/5/27.
//

import Foundation
import Cocoa

struct MoveCommand: DrawCommand {
    static let identifier: String = "M"
    let x: Double
    let y: Double

    init(values: [Double]) {
        x = values[0]
        y = values[1]
    }

    func applyToNSBezierPath(path: NSBezierPath) {
        path.move(to: NSPoint(x: x, y: y))
    }
}
