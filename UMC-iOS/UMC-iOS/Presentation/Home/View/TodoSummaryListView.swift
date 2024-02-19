//
//  TodoSummaryListView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct TodoSummaryListView: View {
    var todoList : TodoListResponse.GetTodoList
    var memberNickname: String
    @Binding var goToTodoList: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("To - Do List")
                    .font(.system(size: 16, weight: .semibold))
                    .kerning(-1.07)
                    .foregroundStyle(Color.main2)
                    .padding(.leading, 18)
                
                Spacer()
            } // HStack
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(todoList.todoLists.indices, id: \.self) { index in
                        TodoSummaryCell(isClicked: $goToTodoList, todoInfo: todoList.todoLists[index])
                    } // ForEach
                    
                    if todoList.todoLists.count <= 2 {
                        ForEach(0..<3) { index in
                            TodoEmptyCell(isClicked: $goToTodoList, memberNickname: memberNickname)
                        }
                    }
                } // HStack
                .padding(.trailing, 18)
            } // ScrollView
            .shadow(color: Color.gray.opacity(0.7), radius: 3, x: 0, y: 2)
            .padding(.top, 8)
        }
    }
}



//#Preview {
//    TodoSummaryListView(TDLList: ["1", "2"], memberInfo: Member())
//}
