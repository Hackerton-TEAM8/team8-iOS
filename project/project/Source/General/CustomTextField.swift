//
//  CustomTextField.swift
//  project
//
//  Created by Subeen on 9/29/24.
//

import SwiftUI

struct CustomTextField: TextFieldStyle {
    

    // 텍스트 필드 스타일 커스텀
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.body3)
            .padding(.vertical, 5)
            .border(width: 0.5, edges: [.bottom], color: Color.text2Gray)
            
    }
}

struct EnterTextField: TextFieldStyle {
    

    // 텍스트 필드 스타일 커스텀
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.body3)
            .padding(.vertical, 5)
            .border(width: 0.5, edges: [.bottom], color: Color.text2Gray)
            
    }
}
