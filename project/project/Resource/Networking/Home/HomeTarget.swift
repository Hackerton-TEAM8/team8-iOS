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
    case createCapsule(timeCapsule: TimeCapsuleRequest, data: Data?)         // 타임캡슐 생성
    case getCapsule(id: Int)                 // 특정 타임캡슐 조회
    case updateCapsule(id: Int)         // 타임캡슐 수정
    case getUserOpendCapsules
    case getUserClosedCapsules
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
            
        case .getUserOpendCapsules:
            return HomeAPI.getUserOpendCapsules.apiDesc
            
        case .getUserClosedCapsules:
            return HomeAPI.getUserClosedCapsules.apiDesc
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
        case .getUserOpendCapsules:
            return .get
        case .getUserClosedCapsules:
            return .get
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
            // 1. JSON 데이터를 멀티파트 데이터로 변환
            let jsonData = try! JSONEncoder().encode(timeCapsule)
            var multipartData = [MultipartFormData]()
            
            // JSON 데이터를 "json" 필드로 추가
            multipartData.append(MultipartFormData(provider: .data(jsonData),
                                                   name: "json",
                                                   mimeType: "application/json"))
            
            // 2. 파일이 있으면 파일 데이터를 추가
            if let fileData = data {
                multipartData.append(MultipartFormData(provider: .data(fileData),
                                                       name: "file",
                                                       fileName: "file.jpg",
                                                       mimeType: "image/jpeg"))
            }
            return .uploadMultipart(multipartData)
        case .getCapsule(let id):
            return .requestPlain
        case .updateCapsule(let id):
            return .requestPlain
            
        case .getUserOpendCapsules:
            return .requestPlain
        case .getUserClosedCapsules:
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
            return ["Content-Type" : "multipart/form-data"]
        case .getCapsule(let id):
            return [:]
        case .updateCapsule(let id):
            return [:]
        case .getUserOpendCapsules:
            return [:]
        case .getUserClosedCapsules:
            return [:]
        }
    }
}
