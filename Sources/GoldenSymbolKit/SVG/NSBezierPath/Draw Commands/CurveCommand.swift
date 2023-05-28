//
//  CurveCommand.swift
//  
//
//  Created by 朱浩宇 on 2023/5/28.
//

import Foundation
import Cocoa

struct CurveCommand: DrawCommand {
    static var identifier: String = "C"

    let controlPoint1: CGPoint
    let controlPoint2: CGPoint
    let endPoint: CGPoint

    init(values: [Double]) {
        controlPoint1 = CGPoint(x: values[0], y: values[1])
        controlPoint2 = CGPoint(x: values[2], y: values[3])
        endPoint = CGPoint(x: values[4], y: values[5])
    }

    func applyToNSBezierPath(path: NSBezierPath) {
        path.curve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
    }
}
