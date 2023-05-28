//
//  CommandList.swift
//  
//
//  Created by 朱浩宇 on 2023/5/28.
//

import Foundation

struct CommandList {
    static let list: [DrawCommand.Type] = [
        MoveCommand.self,
        RelativeMoveCommand.self,

        CloseCommand.self,
        RelativeCloseCommand.self,

        LineCommand.self,
        RelativeLineCommand.self,

        HorizontalLineCommand.self,
        RelativeHorizontalLineCommand.self,

        VerticalLineCommand.self,
        RelativeVerticalLineCommand.self,

        CurveCommand.self,
        RelativeCurveCommand.self
    ]

    static var keywords: [String] {
        list.map { command in
            command.identifier
        }
    }

    static func findCommand(with keyword: String) -> DrawCommand.Type? {
        for command in list {
            if command.identifier == keyword {
                return command
            }
        }

        return nil
    }
}
