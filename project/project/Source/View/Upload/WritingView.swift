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
        VStack {
            if let image = uploadViewModel.mergedImage {
//                Image(uiImage: image)
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 20)
            } else {
                ProgressView()
            }
            
        }
    }
}

struct WritingView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        WritingView(uploadViewModel: .init(container: container))

    }
}
