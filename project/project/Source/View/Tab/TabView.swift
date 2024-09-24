//
//  TabView.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import SwiftUI

struct TabView: View {
    @EnvironmentObject var container: DIContainer
    @EnvironmentObject var authModel: AuthenticationViewModel
    
    @State private var selectedTab: MainTabType = .home
    
    var body: some View {
        Text("TabView")
    }
}

#Preview {
    TabView()
}
