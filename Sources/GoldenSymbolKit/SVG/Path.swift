//
//  Path.swift
//  
//
//  Created by 朱浩宇 on 2023/5/26.
//

import Foundation
import RegexBuilder
import Cocoa
import AppKit

struct Path {
    let raw: String

    init(raw: String) {
        self.raw = raw
    }

    func attribute(of name: String) throws -> String? {
        let regex = Regex {
            "\(name)=\""
            Capture {
                OneOrMore(.reluctant) {
                    #/./#
                }
            }
            "\""
        }

        guard let match = try regex.firstMatch(in: raw)?.output.1 else { return nil }

        return String(match)
    }

    func modifie(by modifiers: [Modifier]) throws -> String {
        var transformString = ""

        for modifier in modifiers {
            transformString += modifier.transform() + " "
        }

        return """
<g transform="\(transformString)">
    \(raw)
</g>
"""
    }

    func modifie(translation: (dx: Double, dy: Double), rotation: Double, scale: Double) throws -> String {
        let bezierPath = try self.toNSBezierPath()
        bezierPath.transform(using: .init(translationByX: translation.dx, byY: translation.dy))

        let originalOrigin = bezierPath.bounds.center

        bezierPath.transform(using: .init(scale: scale))

        let scaledOrigin = bezierPath.bounds.center

        bezierPath.transform(using: .init(translationByX: originalOrigin.x - scaledOrigin.x, byY: originalOrigin.y - scaledOrigin.y))

        bezierPath.transform(using: .init(rotationByDegrees: rotation))

        let rotatedOrigin = bezierPath.bounds.center

        bezierPath.transform(using: .init(translationByX: originalOrigin.x - rotatedOrigin.x, byY: originalOrigin.y - rotatedOrigin.y))

        return bezierPath.toSVG()
    }

    enum Modifier {
        case translate(x: Double, y: Double)
        case scale(ratio: Double)
        case rotate(degree: Double)

        func transform() -> String {
            switch self {
            case .translate(x: let x, y: let y):
                return "translate(\(x) \(y))"
            case .rotate(degree: let degree):
                return "rotate(\(degree))"
            case .scale(ratio: let ratio):
                return "scale(\(ratio))"
            }
        }
    }
}
