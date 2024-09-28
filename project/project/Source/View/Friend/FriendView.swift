//
//  FriendView.swift
//  project
//
//  Created by 어재선 on 9/29/24.
//

import SwiftUI

struct FriendView: View {
    @Environment(\.dismiss) var dismiss
    @State var name: String = ""
    var body: some View {
        VStack{
            HStack{
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.content)
                     
                }
                Spacer()
            }
            HStack{
                
                Text("친구 추가")
                    .font(.title)
                    .padding(.top, 18)
                Spacer()
            }
            HStack {
                TextField("친구의 이름, 혹은 아이디를 검색해주세요", text: $name)
                    .font(.body3)
                Spacer()
                Image(systemName: "magnifyingglass")
            }
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 85)
                    .stroke(Color.black, lineWidth: 0.3)
            )
            if !name.isEmpty {
                FindFriendView
                FindFriendView
            }
            if name.isEmpty {
                HStack{
                    Text("친구 요청")
                        .font(.title)
                        .padding(.top, 18)
                    Spacer()
                    
                }
                FriendRequestView
                
                HStack{
                    Text("친구 목록")
                        .font(.title)
                        .padding(.top, 18)
                    Spacer()
                }
                FriendListView
            }
                
            Spacer()
        }
        .padding(20)
        .navigationBarBackButtonHidden(true)
        
    }
    
    @ViewBuilder
    var FindFriendView: some View {
        VStack {
            HStack{
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black)
                    .frame(width: 50)
                Text("박나영")
                    .font(.subtitle2)
                Spacer()
                Button {
                    
                } label: {
                    Text("친구 추가 \(Image(systemName: "plus"))")
                        .font(.body4)
                        .foregroundStyle(Color.background)
                        .padding(EdgeInsets(top: 6, leading: 9, bottom: 6, trailing: 9))
                        .background(Color.primaryOrange)
                        .cornerRadius(45)
                }
            }
            Divider()
            
        }
        .padding(.top, 10)
    }
    
    @ViewBuilder
    var FriendRequestView: some View {
        VStack {
            HStack{
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black)
                    .frame(width: 50)
                Text("박나영")
                    .font(.subtitle2)
                Spacer()
                Button {
                    
                } label: {
                    Text("친구 수락 ")
                        .font(.body4)
                        .foregroundStyle(Color.background)
                        .padding(EdgeInsets(top: 6, leading: 9, bottom: 6, trailing: 9))
                        .background(Color.primaryOrange)
                        .cornerRadius(45)
                }
                Button {
                    
                } label: {
                    Text("거절")
                        .font(.body4)
                        .foregroundStyle(Color.basicBlack)
                        .padding(EdgeInsets(top: 6, leading: 9, bottom: 6, trailing: 9))
                        .overlay(
                            RoundedRectangle(cornerRadius: 45)
                                .stroke(Color.black, lineWidth: 0.3)
                        )
                }
            }
            Divider()
        }

    }
    
    @ViewBuilder
    var FriendListView: some View {
        
        VStack {
            HStack{
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black)
                    .frame(width: 50)
                Text("박나영")
                    .font(.subtitle2)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.basicBlack)
            }
            Divider()
        }
    }
}

#Preview {
    FriendView()
}
