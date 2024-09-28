//
//  CameraPreview.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

//import SwiftUI
//import AVFoundation
//
//struct CameraPreviewView: UIViewRepresentable {
//    
//    @ObservedObject var uploadViewModel: UploadViewModel
//
//    
//    func makeUIView(context: Context) -> some UIView {
//        let view = UIView(frame: UIScreen.main.bounds)
//        
//        uploadViewModel.preview = AVCaptureVideoPreviewLayer(session: uploadViewModel.session)
//        uploadViewModel.preview.frame = view.frame
//        
//        // 카메라 화면 추가
//        uploadViewModel.preview.videoGravity = .resizeAspectFill
//        view.layer.addSublayer(uploadViewModel.preview)
//        
//        // starting session
//        uploadViewModel.session.stopRunning()
//        
//        return view
//    }
//    
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//        
//    }
//}

import Foundation
import AVFoundation
import SwiftUI

struct CameraPreviewView: UIViewRepresentable {
    class VideoPreviewView: UIView {
        override class var layerClass: AnyClass {
             AVCaptureVideoPreviewLayer.self
        }
        
        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            return layer as! AVCaptureVideoPreviewLayer
        }
    }
    
    let session: AVCaptureSession
    func makeUIView(context: Context) -> VideoPreviewView {
        let view = VideoPreviewView()
        
        view.backgroundColor = .black
        view.videoPreviewLayer.videoGravity = .resizeAspectFill
        view.videoPreviewLayer.cornerRadius = 0
        view.videoPreviewLayer.session = session
        view.videoPreviewLayer.connection?.videoOrientation = .portrait

        return view
    }
    
    func updateUIView(_ uiView: VideoPreviewView, context: Context) {
        
    }
}
