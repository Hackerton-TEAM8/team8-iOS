//
//  FollowingDetailView.swift
//  project
//
//  Created by 어재선 on 9/27/24.
//

import SwiftUI

struct FollowingDetailView: View {
    var item: Int
    var body: some View {
        ZStack {
            Color.black.opacity(0.1)
                .ignoresSafeArea(.all)
            VStack{
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("타이틀")
                            .font(.system(size: 22))
                        ZStack {
                            Rectangle()
                                .frame(width: 160, height: 40)
                                .foregroundStyle(Color.primary.opacity(0.2))
                                .cornerRadius(20)
                            HStack{
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24)
                                Text("2024.09.25 캠출 오픈")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.white)
                                
                            }
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
                .padding()
            
            }
        }
        .toolbar(.hidden,for: .tabBar)
    }
}

#Preview {
    FollowingDetailView(item: 1)
}
