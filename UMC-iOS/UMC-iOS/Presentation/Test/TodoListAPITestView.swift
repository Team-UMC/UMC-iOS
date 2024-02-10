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
    @State private var deleteTodoListId: String = ""
    @State private var completeTodoListId: String = ""
    
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
            
            TextField("삭제할 투두리스트 아이디를 입력하세요.", text: $deleteTodoListId)
            Button {
                Task {
                    await todoListViewModel.fetchDeleteTodoList(todoListId: TodoListRequest.DeleteTodo(todoListId: deleteTodoListId))
                }
            } label: {
                Text("투두리스트 삭제")
            }
            
            TextField("완료할 투두리스트 아이디를 입력하세요.", text: $completeTodoListId)
            Button {
                Task {
                    await todoListViewModel.fetchCompleteTodoList(todoListId: TodoListRequest.CompleteTodo(todoListId: completeTodoListId))
                }
            } label: {
                Text("투두리스트 완료")
            }
        }
    }
}

#Preview {
    TodoListAPITestView()
        .environmentObject(SocialLoginViewModel())
        .environmentObject(LoginViewModel())
}
