//
//  UploadView.swift
//  project
//
//  Created by 최지우 on 9/27/24.
//

import SwiftUI

struct UploadView: View {
    
    @StateObject var uploadViewModel: UploadViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(20).ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack(spacing: 80) {
                    
                    Button {
                        // 갤러리
                        uploadViewModel.send(action: .goToGallery)
                    } label: {
                        VStack {
                            Image(.gallery)
                            Text("갤러리")
                                .font(.body1)
                                .foregroundStyle(Color.text1Black)
                        }
                    }
                    
                    Button {
                        // 카메라
                        uploadViewModel.send(action: .goToCamera)
                    } label: {
                        VStack {
                            Image(.camera)
                            Spacer()
                                .frame(height: 10)
                            Text("바로 촬영")
                                .font(.body1)
                                .foregroundStyle(Color.text1Black)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Color.white)
            }
        }
        .fullScreenCover(item: $uploadViewModel.uploadDestination) {
            switch $0 {
            case .camera:
                CameraView(uploadViewModel: uploadViewModel)
            case .gallery:
                Text("gallery")
            case .writing:
                WritingView(uploadViewModel: uploadViewModel)
            case .canvas:
                CanvasContentView(uploadViewModel: uploadViewModel)
            }
        }
    }
    
}

struct UploadView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        UploadView(uploadViewModel: .init(container: container))
    }
}
