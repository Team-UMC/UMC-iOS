//
//  UniversityAPITestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/11/24.
//

import SwiftUI

struct UniversityAPITestView: View {
    @ObservedObject var userProfileViewModel = UserProfileViewModel()
    @ObservedObject var universityNetwork = UniversityNetwork()
    @EnvironmentObject var socialLoginViewModel: SocialLoginViewModel
    @EnvironmentObject var loginViewModel: LoginViewModel
    var body: some View {
        VStack {
            Button {
                Task {
                    await universityNetwork.fetchGetUniversityList()
                }
            } label: {
                Text("전체 학교 조회 조회")
            }
            
            Button {
                Task {
                    await universityNetwork.fetchGetUniversityDetail()
                }
            } label: {
                Text("우리 학교 세부 정보 조회")
            }
            
            Button {
                Task {
                    await universityNetwork.fetchGetMascotInfo()
                }
            } label: {
                Text("우리 학교 마스코트 조회")
            }
            
            Button {
                Task {
                    await universityNetwork.fetchGetUniversityRanks()
                }
            } label: {
                Text("전체 학교 랭킹 조회")
            }
            
            Button {
                Task {
                    await universityNetwork.fetchGetUniversityContributors()
                }
            } label: {
                Text("우리 학교 전체 기여도 랭킹 조회")
            }
            
            Button {
                Task {
                    await universityNetwork.fetchFeedUniversityMascot(request: UniversityRequest.FeedUniversityMascot(pointType: PointType.PUDDING))
                }
            } label: {
                Text("우리 학교 마스코트 먹이주기 - PUDDING")
            }
            
            Button {
                Task {
                    await universityNetwork.fetchFeedUniversityMascot(request: UniversityRequest.FeedUniversityMascot(pointType: PointType.DOUGHNUT))
                }
            } label: {
                Text("우리 학교 마스코트 먹이주기 - DOUGHNUT")
            }
            
            Button {
                Task {
                    await universityNetwork.fetchCreateUniversityForStaff(request: UniversityRequest.CreateUniversityForStaff(universityName: "리버대학교", universityLogo: "", semesterLogo: "", semester: Semester.FIFTH.rawValue))
                }
            } label: {
                Text("학교 생성하기")
            }
            
//            TextField("수정할 투두리스트 아이디를 입력하세요.", text: $updateTodoListId)
//            Button {
//                Task {
//                    await todoListViewModel.fetchUpdateTodoList(todoListId: updateTodoListId, todoInfo: TodoListRequest.UpdateTodo(title: "수정 테스트 투두리스트", deadline: String.currentLocalDateTimeWithLocaleAndTimeZoneToString()))
//                }
//            } label: {
//                Text("투두리스트 수정")
//            }
        }
    }
}

#Preview {
    UniversityAPITestView()
        .environmentObject(SocialLoginViewModel())
        .environmentObject(LoginViewModel())
}
