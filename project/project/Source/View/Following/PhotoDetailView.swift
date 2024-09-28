//
//  PhotoDetailView.swift
//  project
//
//  Created by 어재선 on 9/29/24.
//

import SwiftUI

struct PhotoDetailView: View {
    @Environment(\.dismiss) var dismiss
    let imageString: String
    var body: some View {
        VStack{
            HStack{
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.background)
                        .padding(20)
                }
                Spacer()
                
            }
            Spacer()
            Image("\(imageString)")
                .resizable()
                .scaledToFit()
          
            Spacer()
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.basicBlack)
        .toolbar(.hidden,for: .tabBar)
    }
}

#Preview {
    PhotoDetailView(imageString: "testPhoto")
}
