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
