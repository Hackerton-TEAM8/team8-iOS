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
                
                HStack {
                    
                    Button {
                        // 갤러리
                        uploadViewModel.send(action: .goToGallery)
                    } label: {
                        Text("갤러리")
                    }
                    
                    Button {
                        // 카메라
                        uploadViewModel.send(action: .goToCamera)
                    } label: {
                        Text("사진 업로드")
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
