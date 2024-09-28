//
//  FollowingView.swift
//  project
//
//  Created by 어재선 on 9/27/24.
//

import SwiftUI

struct FollowingView: View {
    @StateObject var viewModel: FollowingViewModel
    @State private var isHeart: Bool = false
    @State private var heartcouter: Int = 4
    var body: some View {
        NavigationStack {
            VStack {
                topNavigationVar
                    .padding(20)
                
                ScrollView {
                    Spacer()
                    ForEach(viewModel.allTimeCapsule, id: \.timeCapsuleId) { item in
                        NavigationLink(destination: FollowingDetailView(item: item)) {
                            feedView(item: item)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            
                            
                        }
                        
                    }
                }
            }
        }.task{
            await viewModel.getAllCapsules()
            
        }
        
    }
    
    
    @ViewBuilder
    var topNavigationVar: some View {
        HStack {
            Text("Feed")
                .foregroundStyle(Color.content)
                .font(.title)
            Spacer()
            NavigationLink(destination: FriendView()){
                Image(systemName: "person.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)
                    .foregroundStyle(Color.content)
            }
            //            Button {
            //                viewModel.createCapsule(timeCapsuleRequest: TimeCapsuleRequest(userId: 4, title: "타이틀",  text: "내용", unlockDate: "2024-02-25T00:00:00.000000", isActive: false), data: nil)
            //            } label: {
            //                Image(systemName: "person.badge.plus")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 24)
            //                    .foregroundStyle(Color.content)
            //                }
        }
        
    }
    
    @ViewBuilder
    func feedView(item: TimeCapsuleResponse) -> some View {
        ZStack {
            
            Image("\(item.imageUrl ?? "")")
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
                    Text("\(item.userId)")
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
                            Text("\(item.text)")
                                .font(.capsule)
                                .foregroundStyle(.background)
                            
                            if let formattedCreateDate = item.createDate.formatSSSSSSToDate(), let formattedUnlockDateDate = item.unlockDate.formatSSToDate() {
                                Text("\(formattedCreateDate) 작성 · \(formattedUnlockDateDate) 오픈")
                                    .font(.body5)
                                    .foregroundStyle(.background)
                            } else {
                                Text("날짜 형식이 맞지 않습니다.") // 또는 기본값을 제공할 수 있습니다.
                                    .font(.body5)
                                    .foregroundStyle(.background)
                            }
                        }
                        Spacer()
                        VStack(alignment: .center) {
                            Button{
                                self.isHeart.toggle()
                                if self.isHeart {
                                    self.heartcouter += 1
                                } else {
                                    self.heartcouter -= 1
                                }
                                
                            } label: {
                                if isHeart{
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                } else {
                                    Image(systemName: "heart")
                                        .foregroundStyle(.white)
                                }
                            }
                            
                            Text("\(heartcouter)")
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
        
        FollowingView(viewModel: .init(container: .stub))
    }
}

