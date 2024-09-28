//
//  WritingView.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import SwiftUI

struct WritingView: View {
    
    @StateObject var uploadViewModel: UploadViewModel
    
    var body: some View {
        Text("WritingView")
    }
}

struct WritingView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        WritingView(uploadViewModel: .init(container: container))

    }
}
