//
//  CenterRotate.swift
//  
//
//  Created by 朱浩宇 on 2023/5/29.
//

import Foundation
import Cocoa

extension Path.Modifier {
    func centerRotate(degree: Double, path: NSBezierPath) -> (dx: Double, dy: Double) {
        let ox: Double = path.bounds.center.x - path.bounds.origin.x
        let oy: Double = path.bounds.center.y - path.bounds.origin.y

        let supportAngle = atan(oy / ox) * 180 / Double.pi
        let betaAngle = (180 - degree) / 2
        let targetAngle = 180 - supportAngle - betaAngle

        let oLength = (ox * ox + oy * oy).squareRoot()
        let targetLength = 2 * (cos(betaAngle * Double.pi / 180) * oLength)


        return (0, 0)
    }
}
