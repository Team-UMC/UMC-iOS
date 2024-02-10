//
//  TodoListAPITestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import SwiftUI

struct TodoListAPITestView: View {
    @ObservedObject var userProfileViewModel = UserProfileViewModel()
    @ObservedObject var todoListViewModel = TodoListViewModel()
    @EnvironmentObject var socialLoginViewModel: SocialLoginViewModel
    @EnvironmentObject var loginViewModel: LoginViewModel
    @State private var todoListId: String = ""
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await todoListViewModel.fetchGetTodoList()
                }
            } label: {
                Text("투두리스트 조회")
            }
            Button {
                Task {
                    await todoListViewModel.fetchCreateTodoList(todoInfo: TodoListRequest.CreateTodo(title: "테스트 투두리스트", deadline: String.currentLocalDateTimeWithLocaleAndTimeZoneToString()))
                }
            } label: {
                Text("투두리스트 생성")
            }
            
            TextField("삭제할 투두리스트 아이디를 입력하세요.", text: $todoListId)
            Button {
                Task {
                    await todoListViewModel.fetchDeleteTodoList(todoListId: TodoListRequest.DeleteTodo(todoListId: todoListId))
                }
            } label: {
                Text("투두리스트 삭제")
            }
        }
    }
}

#Preview {
    TodoListAPITestView()
        .environmentObject(SocialLoginViewModel())
        .environmentObject(LoginViewModel())
}
