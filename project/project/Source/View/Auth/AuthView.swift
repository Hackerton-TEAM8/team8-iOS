//
//  AuthenticationView.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import SwiftUI

struct AuthView: View {
    
    @EnvironmentObject var container: DIContainer
    @StateObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            switch authViewModel.authentificationState {
            case .unauthenticated:
                OnboardingView()
                    .environmentObject(authViewModel)
            case .authenticated:
                MainTabView()
                    .environmentObject(container)
                    .environmentObject(authViewModel)
            }
        }
    }
}

#Preview {
    AuthView(authViewModel: .init(container: .init(services: StubServices())))
}
