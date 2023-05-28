//
//  RelativeCloseCommand.swift
//  
//
//  Created by 朱浩宇 on 2023/5/28.
//

import Foundation
import Cocoa

struct RelativeCloseCommand: DrawCommand {
    static let identifier: String = "z"

    init(values: [Double]) {

    }

    func applyToNSBezierPath(path: NSBezierPath) {
        path.close()
    }
}
