//
//  ModalView.swift
//  project
//
//  Created by 어재선 on 9/28/24.
//

import SwiftUI



struct ModalView: View {
    @Binding var showModal: Bool
    @State var isClcik: Bool = false
    var body: some View {
        ZStack {
            if isClcik {
                feed
                
                
            } else {
                LottieView(jsonName: "egg_Con")
                    .onTapGesture {
                        isClcik.toggle()
                        
                    }
            }
            
        }
        .background(Color.black.opacity(0.5))
        .background(ClearBackground())
    }
    
    @ViewBuilder
    var feed: some View {
       
        LottieView(jsonName:"cloud_Main")
            .scaledToFill()
            .frame(width: 300)
            .ignoresSafeArea()
        VStack{
            HStack {
                Spacer()
                Button {
                    showModal = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18)
                        .foregroundStyle(.white)
                }
                
            }
            .padding()
            Spacer()
            Image("capsule")
                .resizable()
                .scaledToFit()
                .cornerRadius(35)
                .padding(.leading, 42)
                .padding(.trailing, 42)
            Text("2024.06.30 작성 · 2024.09.28 오픈")
                .foregroundStyle(Color.text2Gray)
                .padding(EdgeInsets(top: 9, leading: 19, bottom: 9, trailing: 19))
                .font(.subtitle1)
                .background(Color.secondary.opacity(0.7))
                .cornerRadius(35)
            Text("종강하는길🥳")
                .font(.title)
            Text("이걸 열어볼 때 쯤이면 이미 개강하고 정신없이 바쁜 하루를 보내고 있겠지..종강만 기다려요...")
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .font(.subtitle1)
            Spacer()
            Spacer()
        }
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
