//
//  CameraViewModel.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import SwiftUI
import Foundation
import AVFoundation

@Observable
class UploadViewModel: ObservableObject {
    
    enum Action {
        case goToGallery
        case goToCamera
        case goToWriting
    }
    
    var uploadDestination: UploadDestination?
    
    var isTaken = false // 사진 촬영 및 사진 선택 여부
//    var session = AVCaptureSession()
//    var alert = false   // 사진 권한 설정
//    var output = AVCapturePhotoOutput()  // 선택한 이미지
//    var preview: AVCaptureVideoPreviewLayer!  // 카메라 프리뷰
    
    private let model: Camera
    private let session: AVCaptureSession
    let cameraPreview: AnyView
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
        model = Camera()
        session = model.session
        cameraPreview = AnyView(CameraPreviewView(session: session))
    }
}

extension UploadViewModel {
    func send(action: Action) {
        switch action {
        case .goToGallery:
            uploadDestination = .gallery
        case .goToCamera:
            uploadDestination = .camera
        case .goToWriting:
            uploadDestination = .writing
        }
    }
    
    func configure() {
            model.requestAndCheckPermissions()
        }
    
    func capturePhoto() {
            print("[CameraViewModel]: Photo captured!")
    }
    
    
    
//    // 카메라 세팅
//    func check() {
//        switch AVCaptureDevice.authorizationStatus(for: .video) {
//        case .authorized:
//            setUp()
//            return
//            
//        case .notDetermined:
//                    // 권한 요청
//                    AVCaptureDevice.requestAccess(for: .video) { [weak self] authStatus in
//                        if authStatus {
//                            DispatchQueue.main.async {
//                                self?.setUp()
//                            }
//                        }
//                    }
//        case .denied:
//            self.alert.toggle()
//            
//        default:
//            return
//        }
//    }
//    
//    func setUp() {
//        // 카메라 세팅
//        if let device = AVCaptureDevice.default(.builtInDualCamera,
//                                                for: .video,
//                                                position: .back) {
//
//            do {
//                // config 세팅
//                
//                self.session.beginConfiguration()
//                
//                
//                let input = try AVCaptureDeviceInput(device: device)
//                
//                // checking and adding to session
//                if self.session.canAddInput(input) {
//                    self.session.addInput(input)
//                }
//                
//                // output도 똑같이 설정
//                
//                if self.session.canAddOutput(self.output) {
//                    self.session.addOutput(self.output)
//                }
//                
//                self.session.commitConfiguration()
//                print("카메라 세팅 완료")
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
}
