//
//  CameraViewModel.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

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
    var session = AVCaptureSession()
    var alert = false   // 사진 권한 설정
    var output = AVCapturePhotoOutput()  // 선택한 이미지
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
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
    
    // 카메라 세팅
    func check() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status {
                    self.setUp()
                }
            }
            
        case .denied:
            self.alert.toggle()
            
        default:
            return
        }
    }
    
    func setUp() {
        // 카메라 세팅
        
        do {
            // config 세팅
            self.session.beginConfiguration()
            
            let devise = AVCaptureDevice.default(.builtInDualCamera,
                                                 for: .video,
                                                 position: .back)
            
//            let input = try AVCaptureDeviceInput(device: device!)
            
            // checking and adding to session
//            if self.session.canAddInput(input) {
//                self.session.addInput(input)
//            }
            
            // output도 똑같이 설정
            
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
