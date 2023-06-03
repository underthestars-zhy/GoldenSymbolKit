//
//  SwiftUIView.swift
//  
//
//  Created by 朱浩宇 on 2023/5/30.
//

import SwiftUI
import Cocoa

extension NSBezierPath {
    func toSVG() -> String {
        var svgPath = ""
        for i in 0..<self.elementCount {
            var points = [NSPoint](repeating: NSZeroPoint, count: 3)
            let elementType = self.element(at: i, associatedPoints: &points)

            switch elementType {
            case .moveTo:
                svgPath += "M\(points[0].x),\(points[0].y) "
            case .lineTo:
                svgPath += "L\(points[0].x),\(points[0].y) "
            case .curveTo:
                svgPath += "C\(points[0].x),\(points[0].y) \(points[1].x),\(points[1].y) \(points[2].x),\(points[2].y) "
            case .closePath:
                svgPath += "Z "
            @unknown default:
                fatalError()
            }
        }

        print(self.bounds.origin)

        return svgPath
    }
}
