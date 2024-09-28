//
//  SignInView.swift
//  project
//
//  Created by 최지우 on 9/29/24.
//

import SwiftUI

enum FocusedFeild {
    case email
    case password
}

struct SignInView: View {
    
    @State private var email = ""
    @State private var isValidEmail = true
    @State private var password = ""
    @State private var isValidPassword = true
    
    @State private var navigationPath = NavigationPath() // 네비게이션 경로를 위한 상태 추가
    @EnvironmentObject var authViewModel: AuthenticationViewModel

    
    var canProceed: Bool {
        Validator.validateEmail(email) && Validator.validatePassword(password)
    }
    
    @FocusState private var focusedField: FocusedFeild?
    
    var body: some View {
        
            VStack {
                
                Spacer()
                    .frame(height: 40)
                
                HStack {
                    ZStack(alignment: .leading) {
                        // 아이콘을 TextField 안에 배치
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 13, height: 13)
                            .foregroundColor(.gray)
                            .padding(.leading, 14)
                            .padding(.trailing, 21)
                        
                        TextField("이메일", text: $email)
                            .focused($focusedField, equals: .email)
                            .padding(.leading, 40)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(!isValidEmail ? Color.red : focusedField == .email ? Color.primaryOrange : Color.gray.opacity(0.2), lineWidth: 1)
                            )
                            .onChange(of: email) { newValue in
                                isValidEmail = Validator.validateEmail(newValue)
                            }
                    }
                    .frame(height: 50)
                    
                    
                }
                
                if !isValidEmail {
                    Text("이메일 형식을 맞춰 작성해주세요")
                        .foregroundColor(.red)
                        .font(.body4)
                        .padding(.leading, 20)
                }
                
                HStack {
                    ZStack(alignment: .leading) {
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 13, height: 16)
                            .foregroundColor(.gray)
                            .padding(.leading, 14)
                            .padding(.trailing, 21)
                        
                        SecureField("비밀번호", text: $password)
                            .focused($focusedField, equals: .password)
                            .padding(.leading, 40)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(!isValidPassword ? Color.red : focusedField == .password ? Color.primaryOrange : Color.gray.opacity(0.2), lineWidth: 1)
                            )
                            .onChange(of: password) { newValue in
                                isValidPassword = Validator.validatePassword(newValue)
                            }
                    }
                    .frame(height: 50)
                    
                    
                }
                
                if !isValidPassword {
                    Text("비밀번호 형식을 맞춰 작성해주세요")
                        .foregroundColor(.red)
                        .font(.body4)
                        .padding(.leading, 20)
                }
                
                Button {
                    authViewModel.signIn()
                    
                } label: {
                    Text("로그인 ->")
                        .font(.capsule)
                        .foregroundStyle(.white)
                }
                .frame(width: 150, height: 50)
                .background(canProceed ? Color.primaryOrange : Color(hex: "#E7E7E7"))
                .cornerRadius(42)
                .disabled(!canProceed)
                .padding(.top, 40)
                
                Spacer()
            }
            .padding(.horizontal, 20)
         
        }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()

    }
}
