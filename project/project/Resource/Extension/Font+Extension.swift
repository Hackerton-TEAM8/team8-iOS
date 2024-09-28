//
//  Font+Extension.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import SwiftUI

extension Font {
    
    // title (Bold)
    static let title: Font = .custom("Inter-Bold", size: 21)
    static let capsule: Font = .custom("Inter-Bold", size: 18)
    
    // SemiBold
//    static let interSemiBold28: Font = .custom("Inter-SemiBold", size: 28)
    
    // subtitle (regular)
    static let subtitle1: Font = .custom("Inter-Regular", size: 16)
    static let subtitle2: Font = .custom("Inter-Regular", size: 14)
    static let subtitle3: Font = .custom("Inter-Regular", size: 13)
    static let subtitle4: Font = .custom("Inter-Regular", size: 11)
    
    // body (regular)
    static let body1: Font = .custom("Inter-Regular", size: 15)
    static let body2: Font = .custom("Inter-Regular", size: 14)
    static let body3: Font = .custom("Inter-Regular", size: 13)
    static let body4: Font = .custom("Inter-Regular", size: 12)
    static let body5: Font = .custom("Inter-Regular", size: 11)
    
    static let navigation: Font = .custom("Inter-Regular", size: 11)
    
    // medium
    static let capsuleDday: Font = .custom("Inter-Medium", size: 13)
    
}

/// 폰트가 추가되었는지 확인
func checkFontFile() {
    for fontFamily in UIFont.familyNames {
        for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
            print(fontName)
        }
    }
}

/// 프레임을 폰트 높이에 맞추기
func heightForFontSize(_ size: CGFloat) -> CGFloat {
    let font = UIFont.systemFont(ofSize: size)
    return font.capHeight
}


