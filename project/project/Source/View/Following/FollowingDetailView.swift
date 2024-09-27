//
//  FollowingDetailView.swift
//  project
//
//  Created by 어재선 on 9/27/24.
//

import SwiftUI

struct FollowingDetailView: View {
    @Environment(\.dismiss) var dismiss
    var item: Int
    @State private var showModel = true
    var body: some View {
        ZStack {
            Image("capsule")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .frame(width: 300)
            
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
                HStack {
                    VStack(alignment: .leading) {
                        Text("타이틀")
                            .font(.title)
                            .foregroundStyle(.background)
                        ZStack {
                            
                            HStack{
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24)
                                Text("2024.09.25 캠출 오픈")
                                    .font(.body4)
                                    .foregroundStyle(.white)
                            }
                            .padding(EdgeInsets(top: 3, leading: 4, bottom: 3, trailing: 11))
                            .background(Color.primary.opacity(0.8))
                            .cornerRadius(30)
                            
                            
                        }
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 27)
                        Text("4")
                    }
                    .foregroundStyle(.white)
                }
                .padding(20)
                
            }
        }
        .navigationBarBackButtonHidden(true)
//        .background(Color.basicBlack.ignoresSafeArea())
        .fullScreenCover(isPresented: $showModel) {
            ModalView(showModal: $showModel)
        }
        .toolbar(.hidden,for: .tabBar)
    }
}

#Preview {
    FollowingDetailView(item: 1)
}
