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
    @State private var goToTodoListAPITestView: Bool = false
    
    var body: some View {
        NavigationStack {
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
                    Text("유저 프로필 조회")
                }
                
                Button {
                    goToTodoListAPITestView.toggle()
                } label: {
                    Text("goToTodoListAPITestView")
                }
                .navigationDestination(isPresented: $goToTodoListAPITestView) {
                    TodoListAPITestView()
                }
            }
        }
    }
}

#Preview {
    ApiTestView()
        .environmentObject(SocialLoginViewModel())
        .environmentObject(LoginViewModel())
}
