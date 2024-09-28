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
    @Binding var type: PKInkingTool.InkType
    @Binding var color: Color
    @Binding var isDraw: Bool
    
    var ink: PKInkingTool {
        PKInkingTool(type, color: UIColor(color))
    }
    
    func makeUIView(context: Context) -> PKCanvasView {
        // 손가락 또는 애플펜슬을 통한 입력을 허용
        canvasView.backgroundColor = .clear
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = ink
        canvasView.becomeFirstResponder()
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
}

struct CanvasContentView: View {
    
    @StateObject var uploadViewModel: UploadViewModel
    
//    @Binding var image: UIImage
//    let onSave: (UIImage) -> Void
    @State private var drawingOnImage: UIImage = UIImage()
    
    @State private var canvasView = PKCanvasView()
    @State private var toolPicker = PKToolPicker()
    
    @State var type: PKInkingTool.InkType = .pen
    @State var color: Color = Color.black
    @State var isDraw = true
    @State var colorPicker = false
    
    
    
    var body: some View {
        VStack {
            
//            paletteView
            VStack {
                Button {

//                    let imageRect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
                    let drawingImage = canvasView.drawing.image(from: canvasView.drawing.bounds, scale: 1)
//                    drawingOnImage = canvasView.drawing.image(from: imgRect, scale: 1.0)
                    if let image = uploadViewModel.mergeImage(drawingImage: drawingImage) {
                        uploadViewModel.send(action: .goToWriting)
                        print(image)
                    } else {
                        
                    }
                } label: {
                    Text("다음")
                    
                }
                imageView
            }
        }
    }
    
    @ViewBuilder
    var imageView: some View {
        ZStack {
            if let image = uploadViewModel.model.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 20)
                    .overlay {
                        CanvasView(canvasView: $canvasView, type: $type, color: $color, isDraw: $isDraw)
                            .onAppear {
                                if let window = UIApplication.shared.windows.first {
                                    toolPicker.setVisible(true, forFirstResponder: canvasView)
                                    toolPicker.addObserver(canvasView)
                                    canvasView.becomeFirstResponder()
                                }
                                
                            }
                    }
            } else {
                ProgressView()
            }
        }
    }

    @ViewBuilder
    var paletteView: some View {
        HStack {
            Button {
                type = .pen
                isDraw = true
                print("pen")
            } label: {
                Image(type == .pen ? .penWhite : .penBlack)
                    
            }
            
            Button {
                type = .marker
                isDraw = true
            } label: {
                Image(type == .marker ? .markerWhite : .markerBlack)
            }
            
            ColorPicker(selection: $color, label: {
                
            })
        }
    }
    
    private func onChanged() -> Void {
            self.drawingOnImage = canvasView.drawing.image(
                from: canvasView.bounds, scale: UIScreen.main.scale)
        }

    
//    private func save() -> Void {
//            onSave(self.image.mergeWith(topImage: drawingOnImage))
//    }
}

struct CanvasContentView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        CanvasContentView(uploadViewModel: .init(container: container))
    }
}
