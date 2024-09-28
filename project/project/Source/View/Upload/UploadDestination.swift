//
//  UploadType.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import Foundation

/// 타임캡슐 사진 업로드 방식 설정
enum UploadDestination: Hashable, Identifiable {
    case gallery
    case camera
    case canvas
    case writing
    
    var id: Int {
        hashValue
    }
}
