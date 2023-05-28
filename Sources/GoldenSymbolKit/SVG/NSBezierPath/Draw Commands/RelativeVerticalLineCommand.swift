//
//  RelativeVerticalLineCommand.swift
//  
//
//  Created by 朱浩宇 on 2023/5/28.
//

import Foundation
import Cocoa

struct RelativeVerticalLineCommand: DrawCommand {
    static let identifier: String = "v"

    let x: Double

    init(values: [Double]) {
        x = values[0]
    }

    func applyToNSBezierPath(path: NSBezierPath) {
        path.relativeLine(to: NSPoint(x: x, y: 0))
    }
}
