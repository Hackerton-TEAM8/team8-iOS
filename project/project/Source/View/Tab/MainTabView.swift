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
                    case .following:
                        FollowingView(viewModel: .init(container: container))
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
                        icon: { Image(systemName: "42.circle") }
                    )
                    
                }
                .tag(tab)
            }
        }
    }
}

#Preview {
    MainTabView()
}
