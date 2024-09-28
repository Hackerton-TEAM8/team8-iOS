//
//  AuthenticationViewModel.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import Foundation

enum AuthenticatedState {
    case unauthenticated    // 로그인 전
    case authenticated      // 로그인 후
}

@Observable
class AuthenticationViewModel: ObservableObject {
    
    var authentificationState: AuthenticatedState = .unauthenticated
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func signIn() {
        authentificationState = .authenticated
    }
}
