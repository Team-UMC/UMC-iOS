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
    @State private var goToUniversityAPITestView: Bool = false
    @State private var goToScheduleAPITestView: Bool = false
    @State private var goToBoardAPITestView: Bool = false
    
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
                    Text("투두리스트 API 테스트 뷰")
                }
                .navigationDestination(isPresented: $goToTodoListAPITestView) {
                    TodoListAPITestView()
                }
                
                Button {
                    goToUniversityAPITestView.toggle()
                } label: {
                    Text("대학교 API 테스트 뷰")
                }
                .navigationDestination(isPresented: $goToUniversityAPITestView) {
                    UniversityAPITestView()
                }
                
                Button {
                    goToScheduleAPITestView.toggle()
                } label: {
                    Text("일정 API 테스트 뷰")
                }
                .navigationDestination(isPresented: $goToScheduleAPITestView) {
                    ScheduleAPITestView()
                }
                
                Button {
                    goToBoardAPITestView.toggle()
                } label: {
                    Text("게시판 API 테스트 뷰")
                }
                .navigationDestination(isPresented: $goToBoardAPITestView) {
                    BoardAPITestView()
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
