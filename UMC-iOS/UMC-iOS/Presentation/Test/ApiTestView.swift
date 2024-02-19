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
    @ObservedObject var joinViewModel = JoinViewModel()
    @ObservedObject var memberNetwork = MemberNetwork()
    @State private var goToTodoListAPITestView: Bool = false
    @State private var goToMembeerAPITestView: Bool = false
    @State private var goToUniversityAPITestView: Bool = false
    @State private var goToScheduleAPITestView: Bool = false
    @State private var goToBoardAPITestView: Bool = false
    @State private var goToFileUploadAPITestView: Bool = false
    @State private var goToInviteAPITestView: Bool = false
    
    @State private var searchMemberId: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    print(String.currentLocalDateToString())
                } label: {
                    Text(String.currentLocalDateToString())
                }
                Button {
//                    print(dateParsing(scheduleInfo: ScheduleResponse.ScheduleInfo(scheduleId: "042b7712-1855-4d65-b30a-4dca63762feb", startDateTime: "2024-02-19T00:00:00", endDateTime: "2024-02-21T23:59:00", hostType: "CENTER")))
                    scheduleInfoListToTaskMetaData(calendarInfo: [ScheduleResponse.ScheduleInfo(scheduleId: "042b7712-1855-4d65-b30a-4dca63762feb", startDateTime: "2024-02-19T00:00:00", endDateTime: "2024-02-21T23:59:00", hostType: "CENTER"),
                                        ScheduleResponse.ScheduleInfo(scheduleId: "042b7712-1855-4d65-b30a-4dca63762feb", startDateTime: "2024-02-19T00:00:00", endDateTime: "2024-02-21T23:59:00", hostType: "CAMPUS"),
                                        ScheduleResponse.ScheduleInfo(scheduleId: "1bf7b53b-d71b-4038-b4f3-3ca4ee40d50f", startDateTime: "2024-02-01T14:00:00", endDateTime: "2024-02-02T14:00:00", hostType: "BRANCH")
                                       ])
                } label: {
                    Text("TEST")
                }
                
                //apple login button
                socialLoginViewModel.appleLoginButton() {
                    loginViewModel.joinMember(socialToken: socialLoginViewModel.socialToken) {
                    }
                }
                
                //kakao login button
                Button {
                    socialLoginViewModel.kakaoLogin(UMCUser: loginViewModel.member) {
                        loginViewModel.joinMember(socialToken: socialLoginViewModel.socialToken) {
                        }
                    }
                } label: {
                    Text("kakaoLogin")
                }
                
                Button {
                    Task {
//                        await joinViewModel.fetchSignUpMember(signUpMemberInfo: MemberRequest.SignUpMember(name: "이경수", nickname: "리버", semesterParts: [MemberRequest.SemesterPart(part: "SPRING", semester: "FIFTH")], universityName: "인하대학교", campusPositions: [], centerPositions: []))
                    }
                } label: {
                    Text("회원가입")
                }
                
                TextField("검색할 유저 아이디를 입력하세요", text: $searchMemberId)
                Button {
                    Task {
                        await memberNetwork.fetchGetMemberProfile(memberId: searchMemberId)
                    }
                } label: {
                    Text("유저 프로필 조회")
                }
                
                Button {
                    goToMembeerAPITestView.toggle()
                } label: {
                    Text("멤버 API 테스트 뷰")
                }
                .navigationDestination(isPresented: $goToMembeerAPITestView) {
                    MemberAPITestView()
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
                
                Button {
                    goToFileUploadAPITestView.toggle()
                } label: {
                    Text("파일 업로드 API 테스트 뷰")
                }
                .navigationDestination(isPresented: $goToFileUploadAPITestView) {
                    FileUploadTestView()
                }
                
                Button {
                    goToInviteAPITestView.toggle()
                } label: {
                    Text("초대코드 API 테스트 뷰")
                }
                .navigationDestination(isPresented: $goToInviteAPITestView) {
                    InviteAPITestView()
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
