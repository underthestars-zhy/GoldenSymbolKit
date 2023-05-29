//
//  Comparable.swift
//  
//
//  Created by 朱浩宇 on 2023/5/29.
//

import Foundation

extension Comparable {
    func clamp(low: Self, high: Self) -> Self {
        if (self > high) {
            return high
        } else if (self < low) {
            return low
        }

        return self
    }
}
