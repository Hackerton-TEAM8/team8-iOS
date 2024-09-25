//
//  TabType.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import Foundation

enum MainTabType: String, CaseIterable {    // CaseIterable : 뷰에서 ForEach로 뷰 그리기
    case home
    case mypage
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .mypage:
            return "내 프로필"
        }
    }
}



