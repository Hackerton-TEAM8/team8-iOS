//
//  HomeView.swift
//  project
//
//  Created by 최지우 on 9/27/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                timeCapsuleView
                dashBoardView
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
                .bold()
                .font(Font.custom("SF Pro Text", size: 21))
            Text("나만의 특별한 타임캡슐!")
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { _ in
                        VStack {
                            
                            ZStack {
                                Image("capsule")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 119, height: 119)
                                    .clipShape(Circle())
                        
                                Text("24살의 \n나에게")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10.5)
                                    .frame(width: 57, height: 21)
                                    .foregroundColor(.blue) 
                                Text("D-1")

                            }
                            .offset(y: -15)

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
            Text("나의 콘텐츠들을 모아봤어요")
            
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
                                    Text("2024.09.25")
                                        .foregroundStyle(.white)

                                }
                                Spacer()
                                
                                VStack {
                                    Image(systemName: "heart")
                                        .foregroundStyle(.white)

                                    Text("12")
                                        .foregroundStyle(.white)

                                }
                                
                                
                            }
                            .padding(13)
                            .background(Color.black.opacity(0.4))
                            
                            
                        }
                        .frame(width: 266, height: 348)
                        .cornerRadius(35)
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

