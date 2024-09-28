//
//  HomeView.swift
//  project
//
//  Created by 최지우 on 9/27/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isHeart: Bool = false
    @State private var heartCnt: Int = 0
    
    var body: some View {
        ScrollView {
            VStack {
                timeCapsuleView
                dashBoardView
                    .padding(.bottom, 18)
                likedContentsView
            }
            .padding(.leading, 20)

        }
//        .background(.yellow)
        .frame(maxWidth: .infinity)
    }
    
    var timeCapsuleView: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .padding(.trailing, 20)
            }
                
            Text("TIME CAPSULE")
                .font(.title)
            Text("나만의 특별한 타임캡슐!")
                .font(.subtitle2)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { _ in
                        VStack {
                            
                            ZStack {
                                Image("capsule1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 117, height: 150)
//                                    .clipShape(Circle())
                                
//                                Image("capsule")
//                                    .clips
                        
                                Text("24살의 \n나에게")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(.capsule)
                                    .padding()
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 32)
                                    .frame(width: 57, height: 25)
                                    .foregroundColor(Color.primary)
                                Text("D-1")
                                    .font(.capsuleDday)
                                    .foregroundStyle(Color.white)
                            }
                            .offset(y: -20)

                        }
                        
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
//        .background(.green)
    }
    
    var dashBoardView: some View {
        VStack(alignment: .leading) {
            Text("DASHBOARD")
                .font(.title)
            Text("나의 콘텐츠들을 모아봤어요")
                .font(.subtitle2)
                .foregroundStyle(Color.text2Gray)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { _ in
                        ZStack(alignment: .bottom) {
                            Image("capsule")
                                .resizable()
                                .frame(width: 266, height: 348)
                                .cornerRadius(35)
                            
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("혼나는 아기강아지☁️")
                                        .foregroundStyle(.white)
                                        .font(.subtitle2)
                                    Text("2024.09.25")
                                        .foregroundStyle(Color.text4GrayDate)
                                        .font(.body5)

                                }
                                Spacer()
                                
                                VStack {
                                    Button {
                                        isHeart.toggle()
                                    } label: {
                                        if isHeart {
                                            Image(systemName: "heart.fill")
                                                .foregroundStyle(.red)
                                        } else {
                                            Image(systemName: "heart")
                                                .foregroundStyle(.white)
                                        }
                                    }

                                    Text("12")
                                        .foregroundStyle(.white)
                                        .font(.subtitle4)
                                }
                                
                                
                            }
                            .padding(13)
                            .background(Color.black.opacity(0.4))

                            
                        }
                        .frame(width: 266, height: 351)
                        .cornerRadius(35)
                        .padding(.trailing, 10)
                        
                    }
                }
            }
            
        }
//        .background(.mint)
    }
    
    var likedContentsView: some View {
        VStack(alignment: .leading) {
            Text("LIKED CONTENTS")
                .font(.title)

            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { _ in
                        ZStack(alignment: .bottom) {
                            Image("capsule")
                                .resizable()
                                .frame(width: 266, height: 348)
                                .cornerRadius(35)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("혼나는 아기강아지 🥺")
                                        .foregroundStyle(.white)
                                        .font(.subtitle2)
                                    Text("2024.09.25")
                                        .foregroundStyle(Color.text4GrayDate)
                                        .font(.body5)

                                }
                                Spacer()
                                
                                VStack {
                                    Button {
                                        isHeart.toggle()
                                    } label: {
                                        if isHeart {
                                            Image(systemName: "heart.fill")
                                                .foregroundStyle(.red)
                                        } else {
                                            Image(systemName: "heart")
                                                .foregroundStyle(.white)
                                        }
                                    }

                                    Text("12")
                                        .foregroundStyle(.white)
                                        .font(.subtitle4)
                                }
                                
                                
                            }
                            .padding(13)
                            .background(Color.black.opacity(0.4))
                            
                            
                        }
                        .frame(width: 266, height: 351)
                        .cornerRadius(35)
                        .padding(.trailing, 10)

                    }
                }
            }
        
        }
//        .background(.mint)
    }
    
    
}

#Preview {
    HomeView()
}

