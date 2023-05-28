//
//  Path.swift
//  
//
//  Created by 朱浩宇 on 2023/5/26.
//

import Foundation
import RegexBuilder

struct Path {
    let raw: String
    var modifiers: [Modifier]

    init(raw: String, modifiers: [Modifier] = []) {
        self.raw = raw
        self.modifiers = modifiers
    }

    func attribute(of name: String) throws -> String? {
        let regex = Regex {
            "name=\""

            Capture {
                OneOrMore(.any, .reluctant)
            }

            "\""
        }

        guard let match = try regex.firstMatch(in: raw)?.output.1 else { return nil }

        return String(match)
    }

    mutating func add(modifier: Modifier) {
        self.modifiers.append(modifier)
    }

    enum Modifier {
        case scale(ratio: Double)
    }
}
