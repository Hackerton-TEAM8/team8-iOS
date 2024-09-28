//
//  HomeView.swift
//  project
//
//  Created by 최지우 on 9/27/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var isHeart: Bool = false
    @State private var heartCnt: Int = 0
    @State private var showModel = true

    
    var body: some View {
        ScrollView {
            VStack {
                timeCapsuleView
                dashBoardView
                    .padding(.bottom, 18)
                likedContentsView
            }
            .padding(.leading, 20)

        }.task {
            await viewModel.getAllCapsules()
        }
        .fullScreenCover(isPresented: $showModel) {
            ModalView(showModal: $showModel)
        }

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
                    ForEach(viewModel.closedCapsule ?? [], id: \.timeCapsuleId) { capsule in
                        VStack {
                            
                            ZStack {
                                Image("capsule1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 117, height: 150)
                                
                                AsyncImage(url: URL(string: capsule.imageUrl ?? "" )) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 117, height: 150)
                                            .cornerRadius(10)
                                            .clipped()
                                            
                                    case .failure(let error):
                                        Text("이미지 로드 실패: \(error.localizedDescription)")
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                
                                
                        
                                Text(capsule.text)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(.capsule)
                                    .padding()
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 32)
                                    .frame(width: 57, height: 25)
                                    .foregroundColor(Color.primaryOrange)
                                Text("D-\(formatDateString(capsule.unlockDate) ?? "Day")")
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
                    ForEach(viewModel.openedCapsule ?? [], id: \.timeCapsuleId) { capsule in
                        ZStack(alignment: .bottom) {
                            AsyncImage(url: URL(string: capsule.imageUrl ?? "" )) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView() 
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 266, height: 348)
                                        .cornerRadius(10)
                                        .clipped()
                                case .failure(let error):
                                    Text("이미지 로드 실패: \(error.localizedDescription)")
                                @unknown default:
                                    EmptyView()
                                }
                            }

                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(capsule.text)
                                        .foregroundStyle(.white)
                                        .font(.subtitle2)
                                    Text(formatDateString(capsule.createDate) ?? "")
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
    
    func formatDateString(_ dateString: String) -> String? {
        // 입력된 날짜 문자열을 Date 객체로 변환하기 위한 DateFormatter 설정
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS" // 입력 형식

        // 변환된 Date 객체
        guard let date = inputFormatter.date(from: dateString) else {
            return nil // 변환 실패 시 nil 반환
        }

        // 출력 형식을 위한 DateFormatter 설정
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy.MM.dd" // 원하는 형식

        // Date 객체를 문자열로 변환 후 반환
        return outputFormatter.string(from: date)
    }
    
}

#Preview {
    HomeView(viewModel: .init(container: .stub))
    
}

