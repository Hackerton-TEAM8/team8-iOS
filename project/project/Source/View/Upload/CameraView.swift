//
//  CameraView.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    
    @StateObject var uploadViewModel: UploadViewModel
    
    var body: some View {
        ZStack {
            Color.basicBlack.ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                cameraButton
            }
        }
    }
    
    @ViewBuilder
    var cameraButton: some View {
        if uploadViewModel.isTaken {
//            let _ =
        } else {
            Button {
                uploadViewModel.isTaken = true
                uploadViewModel.send(action: .goToWriting)
            } label: {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(Color.basicWhite)
                    .overlay {
                        Circle()
                            .strokeBorder(Color.primaryOrange, lineWidth: 5)
                            .frame(width: 60, height: 60)
                            .foregroundStyle(Color.basicWhite)
                    }
                
            }
            .padding(.bottom, 30)
        }
    }
}


struct CameraView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        CameraView(uploadViewModel: .init(container: container))
    }
}
