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
    
    static func colorWithHex(_ hex: String, _ alpha: Double) -> Color {
        var rgb: CUnsignedInt = 0
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        scanner.scanHexInt32(&rgb)
        
        let r = Double((rgb & 0xFF0000) >> 16) / 255.0
        let g = Double((rgb & 0xFF00) >> 8) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        let color = Color(red: r, green: g, blue: b, opacity: alpha)
        
        return color
    }
}


