//
//  Path+NSBezierPath.swift
//  
//
//  Created by 朱浩宇 on 2023/5/27.
//

import Foundation
import Cocoa

extension Path {
    func seprateDrawCommands() throws -> [DrawCommand] {
        guard let rawCommands = try self.attribute(of: "d") else { return [] }

        var drawCommands = [DrawCommand]()

        var sepratedString = [[String]]()
        var index = rawCommands.startIndex

        while index < rawCommands.endIndex {
            let current = String(rawCommands[index])

            if CommandList.keywords.contains(current) {
                sepratedString.append([current])
            } else {
                if !sepratedString.isEmpty {
                    sepratedString[sepratedString.endIndex - 1].append(current)
                }
            }

            index = rawCommands.index(after: index)
        }

        for string in sepratedString {
            let rawValues = string.dropFirst().joined().split { str in
                str == " " || str == ","
            }.map {
                String($0)
            }

            var values = [String]()

            for rawValue in rawValues {
                if rawValue.contains("-") && rawValue[rawValue.startIndex] != "-" {
                    let s = rawValue.split(separator: "-")
                    values.append(String(s[0]))
                    values.append("-\(String(s[1]))")
                } else {
                    values.append(rawValue)
                }
            }

            guard let command = CommandList.findCommand(with: string[0]) else { return [] }
            drawCommands.append(command.init(values: values.compactMap({ str in
                Double(str)
            })))
        }

        return drawCommands
    }

    func toNSBezierPath() -> NSBezierPath {
        let path = NSBezierPath()

        return path
    }
}
