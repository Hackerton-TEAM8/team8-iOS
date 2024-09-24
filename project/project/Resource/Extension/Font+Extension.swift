//
//  Font+Extension.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import SwiftUI

extension Font {
    
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


