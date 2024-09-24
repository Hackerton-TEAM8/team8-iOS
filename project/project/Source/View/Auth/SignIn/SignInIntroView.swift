//
//  SignInIntroView.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import SwiftUI

struct SignInIntroView: View {
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Text("SignInIntroView")
            
            Button {
                authViewModel.authentificationState = .authenticated
            } label: {
                Text("Login")
            }
        }
    }
}

#Preview {
    SignInIntroView()
        .environmentObject(AuthenticationViewModel(container: .init(services: StubServices())))
}
