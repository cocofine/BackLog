//
//  ColorExtention.swift
//  BackLog
//
//  Created by ouyangqi on 2021/8/7.
//

import Foundation
import SwiftUI

extension Double {
    static func randomData() -> Double {
        Double(arc4random()) / Double(UInt32.max)
    }
}

extension Color {
    static func random() -> Color {
        .init(red: Double.randomData(), green: Double.randomData(), blue: Double.randomData())
    }
}


