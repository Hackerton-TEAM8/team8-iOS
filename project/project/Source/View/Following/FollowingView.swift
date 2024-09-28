//
//  FollowingView.swift
//  project
//
//  Created by 어재선 on 9/27/24.
//

import SwiftUI

struct FollowingView: View {
    
    @State private var isHeart: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                topNavigationVar
                    .padding(20)
                
                ScrollView {
                    Spacer()
                    
                    ForEach(0..<20) { item in
                        NavigationLink(destination: FollowingDetailView(item: item)) {
                            feedView(item: item)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                
                        }
                    }
                }
            }
        }
        
    }
    
    
    @ViewBuilder
    var topNavigationVar: some View {
        HStack {
            Text("Feed")
                .foregroundStyle(Color.content)
                .font(.title)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "person.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)
                    .foregroundStyle(Color.content)
            }
        }
        
    }
    
    @ViewBuilder
    func feedView(item: Int) -> some View {
        ZStack {
            Image("capsule")
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.black)
                        .frame(width: 38)
                    Text("name")
                        .font(.subtitle2)
                        .foregroundStyle(Color.background)
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.leading, 16)
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(Color.content.opacity(0.5))
                        .frame(height: 65)
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                    HStack {
                        VStack(alignment: .leading){
                            Text("\(item)번째 게시글")
                                .font(.capsule)
                                .foregroundStyle(.background)
                            Text("2024.07.30 작성 · 2024.09.28 오픈")
                                .font(.body5)
                                .foregroundStyle(.background)
                        }
                        Spacer()
                        VStack(alignment: .center) {
                            Button{
                                isHeart.toggle()
                            } label: {
                                if isHeart{
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                } else {
                                    Image(systemName: "heart")
                                        .foregroundStyle(.white)
                                }
                            }
                            
                            Text("4")
                                .foregroundStyle(.background)
                                .font(.body4)
                        }
                         
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    
                }
            }
        }
        .padding(.top, 24)
     

        
    }
    
}



#Preview {
    NavigationStack {
        
        FollowingView()
    }
}
