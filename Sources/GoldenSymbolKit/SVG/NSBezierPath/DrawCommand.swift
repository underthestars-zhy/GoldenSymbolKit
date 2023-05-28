//
//  DrawCommand.swift
//  
//
//  Created by 朱浩宇 on 2023/5/27.
//

import Foundation
import Cocoa

protocol DrawCommand {
    static var identifier: String { get }

    init(values: [Double])

    func applyToNSBezierPath(path: NSBezierPath)
}
