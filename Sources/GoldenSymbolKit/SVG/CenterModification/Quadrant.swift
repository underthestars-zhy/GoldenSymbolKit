//
//  File.swift
//  
//
//  Created by 朱浩宇 on 2023/5/29.
//

import Foundation

extension Path.Modifier {
    enum Quadrant {
        case first(degree: Double)
        case second(degree: Double)
        case third(degree: Double)
        case forth(degree: Double)
        case positiveX
        case positiveY
        case negativeX
        case negativeY

        static func create(by degree: Double) -> Self {
            let degree = degree.clamp(low: -360, high: 360)

            switch degree {
            case 0, -360:
                return .positiveX
            case 90, -270:
                return .positiveY
            case 180, -180:
                return .negativeX
            case 270, -90:
                return .negativeY
            case 0..<90:
                return .first(degree: degree)
            case -360..<(-270):
                return .first(degree: 360 + degree)
            case 90..<180:
                return .second(degree: degree)
            case -270..<(-180):
                return .second(degree: 360 + degree)
            case 180..<270:
                return .third(degree: degree)
            case -180..<(-90):
                return .third(degree: 360 + degree)
            case 270..<360:
                return .forth(degree: degree)
            case -90..<(-0):
                return .forth(degree: 360 + degree)
            default:
                fatalError()
            }
        }
    }
}
