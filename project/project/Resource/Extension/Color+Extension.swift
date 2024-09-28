//
//  Color+Extension.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import SwiftUI

extension Color {
    
    // basic
    static let basicBlack = Color(hex: "000000")
    static let basicWhite = Color(hex: "FFFFFF")

    static let background = Color(hex: "FFFFFF")
    static let primaryOrange = Color(hex: "#FF512B")
    static let secondary = Color(hex: "#C1FF16")
    static let content = Color(hex: "#424242")
    
    // font
    static let text1Black = Color(hex: "000000")
    static let text2Gray = Color(hex: "424242")
    static let text3Gray = Color(hex: "979797")
    static let text4GrayDate = Color(hex: "D7D7D7")
    
}

public extension Color {

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
