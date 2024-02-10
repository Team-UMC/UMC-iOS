//
//  ApiTestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import SwiftUI

struct ApiTestView: View {
    @ObservedObject var userProfileViewModel = UserProfileViewModel()
    @EnvironmentObject var socialLoginViewModel: SocialLoginViewModel
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Button {
                print(String.currentLocalDateToString())
            } label: {
                Text(String.currentLocalDateToString())
            }
            
            //apple login button
            socialLoginViewModel.appleLoginButton() {
                loginViewModel.joinMember(socialToken: socialLoginViewModel.socialToken) {
                }
            }
            
            //kakao login button
            Button {
                
//                socialLoginViewModel.kakaoLogin(UMCUser: loginViewModel.member) {}
            } label: {
                Text("kakaoLogin")
            }
            
            Button {
                Task {
                    await userProfileViewModel.fetchGetUserProfile()
                }
            } label: {
                Text("UserProfileViewModel.")
            }
        }
        
    }
}

#Preview {
    ApiTestView()
        .environmentObject(SocialLoginViewModel())
        .environmentObject(LoginViewModel())
}
