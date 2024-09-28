//
//  TabView.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var container: DIContainer
    @EnvironmentObject var authModel: AuthenticationViewModel
    
    @State private var selectedTab: MainTabType = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                    switch tab {
                    case .home:
                        HomeView()
                    case .feed:
                        FollowingView()
                    case .search:
                        SearchView()
                    case .upload:
                        UploadView()
                    case .mypage:
                        MyPageView()
                   
                    }
                }
                .tabItem {
                    Label(
                        title: { Text(tab.title) },
                        icon: { Image(getTabImage(tab: tab)) }
                    )
                    
                }
                .tag(tab)
            }
        }
        .accentColor(.black)
    }
    
    // 선택된 탭에 따라 다른 이미지 반환
    func getTabImage(tab: MainTabType) -> String {
        if tab == selectedTab {
            switch tab {
            case .home:
                return "home_sel"
            case .feed:
                return "feed_sel"
            case .search:
                return "search_sel"
            case .upload:
                return "upload_sel"
            case .mypage:
                return "mypage_sel"
            }
        } else {
            // 비활성화된 상태의 이미지
            switch tab {
            case .home:
                return "home"
            case .feed:
                return "feed"
            case .search:
                return "search"
            case .upload:
                return "upload"
            case .mypage:
                return "mypage"
            }
        }
    }
}

#Preview {
    MainTabView()
}
