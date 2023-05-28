//
//  RelativeLineCommand.swift
//  
//
//  Created by 朱浩宇 on 2023/5/28.
//

import Foundation
import Cocoa

struct RelativeLineCommand: DrawCommand {
    static let identifier: String = "l"
    let x: Double
    let y: Double

    init(values: [Double]) {
        x = values[0]
        y = values[1]
    }

    func applyToNSBezierPath(path: NSBezierPath) {
        path.relativeLine(to: NSPoint(x: x, y: y))
    }
}
