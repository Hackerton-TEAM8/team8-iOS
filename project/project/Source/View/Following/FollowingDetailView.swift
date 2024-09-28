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
    var body: some View {
          
            VStack{
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
                feedView
                VStack(alignment: .leading){
                    Text("ㄴㅁㅇㄹㅁㅇㄹㅁㅇㄴㄹㅇㅁㄹ머니아ㅓ리마넝리ㅏㅓ미ㅏㅁㄴ아ㅓㅣㄹ머ㅣ러ㅏㅣasdfasdfadsfadsjflkasdjflka;sjfalksjfalk;sdjf;laksjfakl;sdjfla;ksdjflk;asjfl;kasdjf;lskajf;lkdasjflak;djfl;kadsjf;ldkasjfajkl;sdfj;alksfja;lksdjfsa;kljf;laksjdf;klajfa;lksjfd;salkjaks;ldjfalkjdsflkjflasjdfla;ksjfkla;sjfkla;jfdkla;sjfakl;jfda;lkjfs;kl")
                        .font(.body3)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        
                }
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
    var feedView: some View {
        VStack {
            ZStack {
                NavigationLink(destination: PhotoDetailView()){
                    Image("capsule")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)                    
                }
                VStack {
                    Spacer()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("타이틀")
                                .font(.title)
                                .foregroundStyle(.background)
                            
                                
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
                    .padding(5)
                 
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
