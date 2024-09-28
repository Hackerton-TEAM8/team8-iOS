//
//  CanvasView.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    
    @Binding var canvasView: PKCanvasView
    
    func makeUIView(context: Context) -> PKCanvasView {
        // 손가락 또는 애플펜슬을 통한 입력을 허용
        canvasView.drawingPolicy = .anyInput
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
}

struct CanvasContentView: View {
    @State private var canvasView = PKCanvasView()
    @State private var toolPicker = PKToolPicker()
    
    var body: some View {
        VStack {
            CanvasView(canvasView: $canvasView)
                .onAppear {
                    if let window = UIApplication.shared.windows.first {
                        toolPicker.setVisible(true, forFirstResponder: canvasView)
                        toolPicker.addObserver(canvasView)
                        canvasView.becomeFirstResponder()
                    }
                }
                .background(Color.white)
        }
    }
    
}

#Preview {
    CanvasContentView()
}
