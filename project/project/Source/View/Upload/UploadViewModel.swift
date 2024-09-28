//
//  CameraViewModel.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import SwiftUI
import Foundation
import AVFoundation
import PhotosUI

@Observable
class UploadViewModel: ObservableObject {
    
    enum Action {
//        case goToGallery
        case goToCamera
        case goToCanvas
        case goToWriting
    }
    
    var uploadDestination: UploadDestination?
    
    var isTaken = false // 사진 촬영 및 사진 선택 여부
    
    let model: Camera
    private let session: AVCaptureSession
    let cameraPreview: AnyView
    
    
    
    private var container: DIContainer
    
    var mergedImage: UIImage?
    
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
//        case .goToGallery:
//            uploadDestination = .gallery
        case .goToCamera:
            uploadDestination = .camera
        case .goToCanvas:
            uploadDestination = .canvas
        case .goToWriting:
            uploadDestination = .writing
        }
    }
    
    func configure() {
            model.requestAndCheckPermissions()
        }
    
    func mergeImage(drawingImage: UIImage) -> UIImage? {
        print("mergeImage")
        var image =  model.selectedImage?.mergeWith(topImage: drawingImage)
        self.mergedImage =  image
        return image
    }
    
    func loadImageFromPickerItem(_ item: PhotosPickerItem) {
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.model.selectedImage = image
                        }
                    }
                case .failure(let error):
                    print("Error loading image: \(error)")
                }
            }
    }
    
}
