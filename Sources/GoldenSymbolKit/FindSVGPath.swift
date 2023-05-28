//
//  FindSVGPath.swift
//  
//
//  Created by 朱浩宇 on 2023/5/26.
//

import Foundation

extension GoldenSymbolKit {
    func findSVGPath(in svg: String) throws -> Path? {
        let regex = #/d="(.+?)"/#
        guard let path = try regex.firstMatch(in: svg)?.output.1 else { return nil }
        return Path(raw: String(path))
    }

    func findSVGPath(from file: URL) throws -> Path? {
        let svgString = try String(contentsOf: file)

        return try findSVGPath(in: svgString)
    }
}
