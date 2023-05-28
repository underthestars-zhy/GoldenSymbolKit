//
//  HorizontalLineCommand.swift
//
//
//  Created by 朱浩宇 on 2023/5/28.
//

import Foundation
import Cocoa

struct HorizontalLineCommand: DrawCommand {
    static let identifier: String = "H"

    let y: Double

    init(values: [Double]) {
        y = values[0]
    }

    func applyToNSBezierPath(path: NSBezierPath) {
        path.line(to: NSPoint(x: path.currentPoint.x, y: y))
    }
}
