//
//  OnboardingView.swift
//  project
//
//  Created by 최지우 on 9/29/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                LottieView(jsonName:"OnboardingCloud")
                    .ignoresSafeArea()
                    

                VStack {
                    Spacer()
                        .frame(height: 50)
                    
                    Text("우리만의 상상놀이터가 펼쳐지는 곳,")
                        .font(.subtitle1)
                        .foregroundStyle(Color.text2Gray)
                        .padding(5)

                    Text("타임캡쳐")
                        .font(.title)
                        .padding(.bottom, 0)
                    
                    Image("timeCaptureLogo")
                        .padding(.bottom, 260)
                        
                    
                    NavigationLink(destination: SignInView()) {
                        Text("로그인하기")
                            .frame(width: 353, height: 58)
                            .font(.capsule)
                            .foregroundStyle(Color.white)
                            .background(Color.primaryOrange)
                            .cornerRadius(105)
                            .padding(.bottom, 15)
                    }
                    
                    Text("회원가입")
                        .font(.body2)
                        .foregroundStyle(Color.text2Gray)
                        .underline()
                }
                

            }
        }
        .ignoresSafeArea(.all) // 전체 화면에 맞추기

    }

}


#Preview {
    OnboardingView()
}

