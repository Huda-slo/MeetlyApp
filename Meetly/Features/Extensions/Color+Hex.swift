//
//  Color+Hex.swift
//  1
//
//  Created by Azhar on 08/11/2025.
//

import SwiftUI

extension Color {
    /// يدعم RGB (6 خانات) و ARGB (8 خانات)
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 8: // ARGB
            (a, r, g, b) = (
                int >> 24,
                (int >> 16) & 0xFF,
                (int >> 8) & 0xFF,
                int & 0xFF
            )
        default: // RGB
            (a, r, g, b) = (
                255,
                int >> 16,
                (int >> 8) & 0xFF,
                int & 0xFF
            )
        }

        self.init(
            .sRGB,
            red:   Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
