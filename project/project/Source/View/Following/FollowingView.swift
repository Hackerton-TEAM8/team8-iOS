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
                
                ScrollView {
                    Spacer()
                    
                    ForEach(0..<20) { item in
                        NavigationLink(destination: FollowingDetailView(item: item)) {
                            feedView(item: item)
                        }
                    }
                }
            }
            .padding(20)
        }
        .accentColor(.black)
    }
    
    
    @ViewBuilder
    var topNavigationVar: some View {
        HStack {
            Text("Feed")
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .font(.system(size: 21))
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "person.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)
                    .foregroundStyle(.black)
            }
        }
        
    }
    @ViewBuilder
    func feedView(item: Int) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.primary.opacity(0.1))
                .frame( height: 400)
                .cornerRadius(15)
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.black)
                        .frame(width: 38)
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.leading, 16)
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(Color.primary.opacity(0.1))
                        .frame(height: 65)
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                    HStack {
                        VStack(alignment: .leading){
                            Text("\(item)번째 게시글")
                                .font(.system(size: 18))
                                .foregroundStyle(.white)
                            Text("2024.09.25")
                                .font(.system(size: 11))
                                .foregroundStyle(.gray)
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
                                .foregroundStyle(.white)
                                .font(.system(size: 11))
                        }
                         
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    
                }
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 35)

        
    }
    
}



#Preview {
    NavigationStack {
        
        FollowingView()
    }
}
