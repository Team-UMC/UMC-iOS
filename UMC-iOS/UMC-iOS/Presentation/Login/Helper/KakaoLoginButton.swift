//
//  KakaoLoginButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/6/24.
//

import SwiftUI

struct KakaoLoginButton: View {
    @EnvironmentObject var socialLoginViewModel: SocialLoginViewModel
    @EnvironmentObject var loginViewModel: LoginViewModel
    @Binding var isLoggedIn: Bool
    @Binding var alreadyMember: Bool
    var body: some View {
        
        Button {
            socialLoginViewModel.kakaoLogin(UMCUser: loginViewModel.member) {
                if (socialLoginViewModel.isLoggedIn) {
                    loginViewModel.joinMember(socialToken: socialLoginViewModel.socialToken){
                        isLoggedIn = true
                    }
                } else {
                    isLoggedIn = false
                }
            }
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
}
