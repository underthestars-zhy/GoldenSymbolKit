//
//  RelativeHorizontalLineCommand.swift
//  
//
//  Created by 朱浩宇 on 2023/5/28.
//

import Foundation
import Cocoa

struct RelativeHorizontalLineCommand: DrawCommand {
    static let identifier: String = "h"

    let y: Double

    init(values: [Double]) {
        y = values[0]
    }

    func applyToNSBezierPath(path: NSBezierPath) {
        path.relativeLine(to: NSPoint(x: 0, y: y))
    }
}
