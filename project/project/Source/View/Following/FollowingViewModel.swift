//
//  FollowingViewModel.swift
//  project
//
//  Created by 어재선 on 9/28/24.
//

import Foundation

@Observable
class FollowingViewModel: ObservableObject {
    
    var allTimeCapsule: [TimeCapsuleResponse] = [.stub01, .stub02,.stub03, .stub04, .stub05, .stub06, .stub07, .stub08, .stub09, .stub10]
    // DIContainer를 통해 API 통신 요청 함수 실행 (Service 접근)
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
        
        
    }
    
}

extension FollowingViewModel {
    func getAllCapsules() async {
        do {
            // 모든 타임캡슐 요청하여 ViewModel에 있는 allTimeCapsule로 전달
//            try await allTimeCapsule = container.services.homeService.getAllCapsules()
            
        } catch {
            print("getAllCapsules() error")
        }
        
    }
    func createCapsule(timeCapsuleRequest: TimeCapsuleRequest, data: Data?) {
        container.services.homeService.createCapsule(timeCapsuleRequest: timeCapsuleRequest, data: data)
        
    }
}
