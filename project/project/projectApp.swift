//
//  projectApp.swift
//  project
//
//  Created by Subeen on 9/25/24.
//

import SwiftUI

@main
struct projectApp: App {
    
    @StateObject var container: DIContainer = .init(services: Services())
    
    var body: some Scene {
        WindowGroup {
            AuthView(authViewModel: .init(container: container))
        }
    }
}
