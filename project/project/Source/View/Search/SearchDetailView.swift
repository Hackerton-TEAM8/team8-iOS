//
//  SearchDetailView.swift
//  project
//
//  Created by 어재선 on 9/29/24.
//

import SwiftUI

struct SearchDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State var isHeart: Bool = false
    @State var heartCount: Int = 0
    var body: some View {
        VStack{
            HStack{
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.content)
                }
                Text("검색")
                    .font(.capsule)
                Spacer()
            }
            .padding([.leading,.bottom], 20)
            HStack {
                Button {
                    
                } label: {
                    Text("#가을")
                        .font(.capsule)
                        .foregroundStyle(Color.basicBlack)
                        .padding(EdgeInsets(top: 8, leading: 19, bottom: 7, trailing: 19))
                        .background(Color.secondaryYellow)
                        .cornerRadius(73)
                }
                Button {
                    
                } label: {
                    Text("유사한 무드")
                        .font(.subtitle2)
                        .foregroundStyle(Color.text3Gray)
                        .padding(EdgeInsets(top: 8, leading: 19, bottom: 7, trailing: 19))
                        .background(.gray.opacity(0.3))
                        .cornerRadius(73)
                }
                Button {
                    
                } label: {
                    Text("유사 검색 결과")
                        .font(.subtitle2)
                        .foregroundStyle(Color.text3Gray)
                        .padding(EdgeInsets(top: 8, leading: 19, bottom: 7, trailing: 19))
                        .background(.gray.opacity(0.3))
                        .cornerRadius(73)
                }
                Spacer()
                
            }
            .padding(.horizontal, 20)
            ScrollView{
                ForEach(0..<10) { _ in
                    HStack{
                        feedView(item: .stub01)
                        feedView(item: .stub02)
                    }
                }
                
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    func feedView(item: TimeCapsuleResponse) -> some View {
        ZStack {
            
            Image("\(item.imageUrl ?? "")")
                .resizable()
                .scaledToFill()
                .frame(width: 170, height: 243)
                .cornerRadius(15)
            
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.black)
                        .frame(width: 26)
                        .padding(.leading,5)
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
                        .frame(width: 170,height: 53)
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                    HStack {
                        VStack(alignment: .leading){
                            Text("\(item.text)")
                                .font(.subtitle1)
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
                        .padding(.leading, 5)
                        Spacer()
                        VStack(alignment: .center) {
                            Button{
                                self.isHeart.toggle()
                                if self.isHeart {
                                    self.heartCount += 1
                                } else {
                                    self.heartCount -= 1
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
                            
                            Text("\(heartCount)")
                                .foregroundStyle(.background)
                                .font(.body4)
                        }.padding(.trailing,5)
                        
                    }
                    .scaledToFit()
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    
                }
            }
        }
        .padding(.top, 24)
        
        
        
    }
}

#Preview {
    SearchDetailView()
}
