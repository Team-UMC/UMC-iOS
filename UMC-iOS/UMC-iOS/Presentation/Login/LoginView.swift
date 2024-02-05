//
//  LoginView.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/5/24.
//

import SwiftUI

struct LoginView:View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var alreadyMember: Bool = false
    
    var body: some View {
        ZStack {
            Image("signup_background")
                .resizable()
            VStack (spacing: 16){
                
                Spacer()
                //google login button
                Button {
                } label: {
                    HStack(spacing: 32) {
                        Image("Google")
                            .frame(width: 20, height: 20)
                        Text("Google로 계속하기")
                            
                    }
                    .frame(width: 272, height: 44)
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(12)
                .padding(12)
                        
                }
                
                //apple login button
                AppleLoginButton(isLoggedIn: $loginViewModel.isLoggedIn, alreadyMember: $alreadyMember)
                
                //kakao login button
                Button {
                } label: {
                    HStack(spacing: 32) {
                        Image("Kakao")
                            .frame(width: 20, height: 20)
                        Text("Kakao로 계속하기")
                    }
                    .frame(width: 272, height: 44)
                //카카오 container color (#FEE500)
                    .background(Color(red: 254/255, green: 229/255, blue: 0/255))
                    .foregroundColor(.black)
                    .cornerRadius(12)
                .padding(12)
                }
                
            }
            .padding(.bottom, 128)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
