//
//  FollowingDetailView.swift
//  project
//
//  Created by 어재선 on 9/27/24.
//

import SwiftUI

struct FollowingDetailView: View {
    var item: Int
    @State private var showModel = true
    var body: some View {
        ZStack {
            Color.black.opacity(0.1)
                .ignoresSafeArea(.all)
            
            if showModel {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
            }
            VStack{
                
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("타이틀")
                            .font(.system(size: 22))
                        ZStack {
                            Rectangle()
                                .frame(width: 160, height: 40)
                                .foregroundStyle(Color.primary.opacity(0.2))
                                .cornerRadius(20)
                            HStack{
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24)
                                Text("2024.09.25 캠출 오픈")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.white)
                                
                            }
                        }
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
                .padding()
            
            }
        }
        .fullScreenCover(isPresented: $showModel) {
            ModalView(showModal: $showModel)
        }
        .toolbar(.hidden,for: .tabBar)
    }
}

struct ModalView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        ZStack {
            LottieView(jsonName:"cloud")
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("종강하는길 🥱")
                    .font(.title)
                    .padding()
                
                Text("2024.06.30 작성 • 2024.09.28 오픈")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("이걸 열어볼 때 쯤이면 이미 개강하고 정신없이 바쁜 하루를 보내고 있겠지.. 종강만 기다려요...")
                    .padding()
                    .multilineTextAlignment(.center)
                
                Spacer()
                
              
            }
        }
        .background(ClearBackground())
    }
}

struct ClearBackground: UIViewRepresentable {
    
    public func makeUIView(context: Context) -> UIView {
        
        let view = ClearBackgroundView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    public func updateUIView(_ uiView: UIView, context: Context) {}
}

class ClearBackgroundView: UIView {
    open override func layoutSubviews() {
        guard let parentView = superview?.superview else {
            return
        }
        parentView.backgroundColor = .clear
    }
}

#Preview {
    FollowingDetailView(item: 1)
}
