//
//  FollowingDetailView.swift
//  project
//
//  Created by 어재선 on 9/27/24.
//

import SwiftUI

struct FollowingDetailView: View {
    @Environment(\.dismiss) var dismiss
    var item: TimeCapsuleResponse
    @State private var showModel = true
    @State private var isheart: Bool = false
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.content)
                        .padding(20)
                }
                Spacer()
            }
            Spacer()
            feedView(imageString: "testPhoto")
            VStack {
                
                HStack {
                    VStack(alignment: .leading) {
                       
                        
                        
                        HStack{
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24)
                            Text("2024.07.30 작성 · 2024.09.28 오픈")
                                .font(.body4)
                                .foregroundStyle(.white)
                        }
                        .padding(EdgeInsets(top: 3, leading: 4, bottom: 3, trailing: 11))
                        .background(Color.primaryOrange.opacity(0.8))
                        .cornerRadius(30)
                        Text("타이틀")
                            .font(.title)
                            .foregroundStyle(Color.basicBlack)
                    }
                    Spacer()
                    VStack {
                        Button {
                            self.isheart.toggle()
                        } label: {
                            if isheart {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 27)
                                    .foregroundStyle(.red)
                            } else {
                                Image(systemName: "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 27)
                            }
                        }
                        
                        Text("4")
                    }
                    .foregroundStyle(Color.basicBlack)
                }
                
            }
            .padding(.leading,20)
            .padding(.trailing, 20)
            .padding(.bottom, 9)
            Text("부산 여행에 왔다️🏖️\n바다도 보고 여름 과일도 먹는 중!!")
            
                .font(.body3)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            Spacer()
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.background.ignoresSafeArea())
        //        .fullScreenCover(isPresented: $showModel) {
        //            ModalView(showModal: $showModel)
        //        }
        
    }
    
    @ViewBuilder
    func feedView(imageString: String) -> some View {
        VStack {
            ZStack {
                NavigationLink(destination: PhotoDetailView(imageString: imageString)){
                    Image("\(imageString)")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                }
                
            }
            .scaledToFit()
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 11, trailing: 20))
        
    }
}

#Preview {
    NavigationStack {
        FollowingDetailView(item: .stub01)
    }
}
