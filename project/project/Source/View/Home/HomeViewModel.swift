//
//  HomeViewModel.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import Combine
import SwiftUI

@Observable
class HomeViewModel: ObservableObject {
    // 응답값 프로퍼티
    var allTimeCapsule: [TimeCapsuleResponse]?
    
    // DIContainer를 통해 API 통신 요청 함수 실행 (Service 접근)
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
}

extension HomeViewModel {
    func getAllCapsules() async {
        do {
            // 모든 타임캡슐 요청하여 ViewModel에 있는 allTimeCapsule로 전달
            allTimeCapsule = try await container.services.homeService.getAllCapsules()
        } catch {
            print("getAllCapsules() error")
        }
    }
}
