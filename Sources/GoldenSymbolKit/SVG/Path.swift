//
//  Path.swift
//  
//
//  Created by 朱浩宇 on 2023/5/26.
//

import Foundation
import RegexBuilder
import Cocoa

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
        let bezierPath = try self.toNSBezierPath()

        for modifier in modifiers {
            transformString += modifier.transform(bezierPath) + " "
        }

        return """
<g transform="\(transformString)">
    \(raw)
</g>
"""
    }

    enum Modifier {
        case translate(x: Double, y: Double)
        case scale(ratio: Double)
        case rotate(degree: Double)

        func transform(_ path: NSBezierPath) -> String {
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
