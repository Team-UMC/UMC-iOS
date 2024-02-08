//
//  ApiTestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import SwiftUI

struct ApiTestView: View {
    @ObservedObject var userProfileViewModel = UserProfileViewModel()
    @EnvironmentObject var loginViewModel: SocialLoginViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            
            //apple login button
            loginViewModel.appleLoginButton() {
                userViewModel.joinMember(socialToken: loginViewModel.socialToken) {
                }
            }
            
            //kakao login button
            Button {
                
                loginViewModel.kakaoLogin(UMCUser: userViewModel.user) {}
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
}
