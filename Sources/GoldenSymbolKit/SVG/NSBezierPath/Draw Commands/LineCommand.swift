//
//  LineCommand.swift
//  
//
//  Created by 朱浩宇 on 2023/5/28.
//

import Foundation
import Cocoa

struct LineCommand: DrawCommand {
    static let identifier: String = "L"
    let x: Double
    let y: Double

    init(values: [Double]) {
        x = values[0]
        y = values[1]
    }

    func applyToNSBezierPath(path: NSBezierPath) {
        path.line(to: NSPoint(x: x, y: y))
    }
}
