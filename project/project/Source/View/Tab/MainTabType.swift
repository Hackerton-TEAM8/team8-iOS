//
//  TabType.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import Foundation

enum MainTabType: String, CaseIterable {    // CaseIterable : 뷰에서 ForEach로 뷰 그리기
    case home
    case feed
    case search
    case upload
    case mypage
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .feed:
            return "피드"
        case .search:
            return "검색"
        case .upload:
            return "업로드"
        case .mypage:
            return "마이페이지"
        }
    }
}
