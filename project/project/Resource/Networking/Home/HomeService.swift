//
//  HomeService.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import Foundation
import Combine
import CombineMoya
import Moya
import SwiftUI

protocol HomeServiceType {
    func getAllCapsules() async throws -> TimeCapsuleResponse
}

class HomeService: HomeServiceType {
    private let jsonDecoder = JSONDecoder()
    let provider = MoyaProvider<HomeTarget>(plugins: [MoyaLoggingPlugin()])
    
    // TODO: - 응답값 모델 형식에 맞춰 TimeCapsuleResponse 구조체 수정하기
    func getAllCapsules() async throws -> TimeCapsuleResponse {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getAllCapsules) { result in
                switch result {
                case .success(let response):
                    do {
                        let decodedResponse = try JSONDecoder().decode(TimeCapsuleResponse.self, from: response.data)
                        continuation.resume(returning: decodedResponse)
                        //                        print("response \(decodedResponse)")
                        print("모든 타임캡슐 조회 성공")
                    } catch {
                        Log.network("모든 타임캡슐 Decode 실패", error)
                    }
                case .failure(let error):
                    Log.network("모든 타임캡슐 조회 네트워크 오류", error)
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

class StubHomeService: HomeServiceType {
    func getAllCapsules() async throws -> TimeCapsuleResponse {
        return .init()
    }
}
