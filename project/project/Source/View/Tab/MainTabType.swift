//
//  TabType.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import Foundation

enum MainTabType: String, CaseIterable {    // CaseIterable : 뷰에서 ForEach로 뷰 그리기
    case home
    case following
    case search
    case upload
    case mypage
    
    var title: String {
        switch self {
        case .home:
            return "home"
        case .following:
            return "following"
        case .search:
            return "search"
        case .upload:
            return "upload"
        case .mypage:
            return "mypage"
        }
    }
}
