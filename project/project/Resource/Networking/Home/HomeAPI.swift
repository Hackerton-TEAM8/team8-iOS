//
//  HomeAPI.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import Foundation

/// Home

public enum HomeAPI {
    case getAllCapsules             // 타임캡슐 전체 조회
    case createCapsule(Int)         // 타임캡슐 생성
    case getCapsule                 // 특정 타임캡슐 조회
    case updateCapsule(Int)         // 타임캡슐 수정
    
    public var apiDesc: String {
        switch self {
        case .getAllCapsules:
            return "/api/v1/timecapsule"
        case .createCapsule(let id):
            return "/api/v1/timecapsule/\(id)"
        case .getCapsule:
            return "/api/v1/timecapsule"
        case .updateCapsule(let id):
            return "/api/v1/timecapsule/\(id)"
        }
    }
}
