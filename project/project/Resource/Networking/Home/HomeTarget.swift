//
//  HomeTarget.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import Foundation
import Moya

enum HomeTarget {
    case getAllCapsules             // 타임캡슐 전체 조회
    case deleteCaptsule(id: Int)             // 타임캡슐 삭제
    case createCapsule(timeCapsule: TimeCapsuleResponse, data: Data?)         // 타임캡슐 생성
    case getCapsule(id: Int)                 // 특정 타임캡슐 조회
    case updateCapsule(id: Int)         // 타임캡슐 수정
}

extension HomeTarget: BaseTargetType {
    var path: String {
        switch self {
        case .getAllCapsules:
            return HomeAPI.getAllCapsules.apiDesc
            
        case .deleteCaptsule(let id):
            return HomeAPI.deleteCaptsule(id).apiDesc
            
        case .createCapsule(_, _):
            return HomeAPI.createCapsule.apiDesc
            
        case .getCapsule(let id):
            return HomeAPI.getCapsule(id).apiDesc
            
        case .updateCapsule(let id):
            return HomeAPI.updateCapsule(id).apiDesc
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllCapsules:
            return .get
        case .deleteCaptsule:
            return .delete
        case .createCapsule:
            return .post
        case .getCapsule:
            return .get
        case .updateCapsule:
            return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAllCapsules:
            return .requestPlain
            
        // TODO: - 요청 방식 수정하기
        case .deleteCaptsule(let id):
            return .requestPlain
        case .createCapsule(let timeCapsule, let data):
            return .requestPlain
        case .getCapsule(let id):
            return .requestPlain
        case .updateCapsule(let id):
            return .requestPlain
        }
    }
    
    // TODO: - Post 할 때 content-type multipart 설정하기
    var headers: [String : String]? {
        switch self {
        case .getAllCapsules:
            return [:]
        case .deleteCaptsule(let id):
            return [:]
        case .createCapsule(let timeCapsule, let data):
            return [:]
        case .getCapsule(let id):
            return [:]
        case .updateCapsule(let id):
            return [:]
        }
    }
}
