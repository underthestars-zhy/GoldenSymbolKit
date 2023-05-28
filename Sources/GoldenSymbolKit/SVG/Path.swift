//
//  Path.swift
//  
//
//  Created by 朱浩宇 on 2023/5/26.
//

import Foundation

struct Path {
    let raw: String
    var modifiers: [Modifier]

    init(raw: String, modifiers: [Modifier] = []) {
        self.raw = raw
        self.modifiers = modifiers
    }

    func svg() -> String {
        "<path d=\"\(raw)\" \\>"
    }

    mutating func add(modifier: Modifier) {
        self.modifiers.append(modifier)
    }

    enum Modifier {
        case scale(ratio: Double)
    }

    func translateSVGPath(_ path: String, _ translationX: Double, _ translationY: Double) -> String {
        var translatedPath = ""

        let components = path.components(separatedBy: CharacterSet(charactersIn: "MLCZ")).filter { !$0.isEmpty }

        for component in components {
            let command = component.prefix(1)
            let values = component.dropFirst().components(separatedBy: ",")

            var translatedValues = [String]()

            for i in stride(from: 0, to: values.count, by: 2) {
                if let x = Double(values[i]), let y = Double(values[i + 1]) {
                    let translatedX = x + translationX
                    let translatedY = y + translationY
                    translatedValues.append("\(translatedX),\(translatedY)")
                }
            }

            if !translatedValues.isEmpty {
                translatedPath += "\(command)\(translatedValues.joined(separator: ",")))"
            }
        }

        return translatedPath
    }
}
