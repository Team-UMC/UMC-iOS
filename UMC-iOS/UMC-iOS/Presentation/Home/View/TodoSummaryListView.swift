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
    @Binding var goToTodoListUI: Bool
    
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
                        TodoSummaryCell(isClicked: $goToTodoListUI, todoInfo: todoList.todoLists[index])
                    } // ForEach
                    
                    
                    TodoEmptyCell(isClicked: $goToTodoListUI, memberNickname: memberNickname)
                } // HStack
                .padding(.trailing, 18)
            } // ScrollView
            .shadow(color: Color.gray.opacity(0.7), radius: 3, x: 0, y: 2)
            .padding(.top, 8)
        }
    }
}

struct TodoSummaryCell: View {
    @Binding var isClicked: Bool
    let todoInfo: TodoListResponse.TodoListInfo
    var body: some View {
        Button {
            print("TDLPlusButton Clicked")
            isClicked.toggle()
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: 122, height: 134)
                    .foregroundColor(Color.main3)
                    .cornerRadius(20)
                    .padding(.leading, 18)
                VStack {
                    VStack(spacing: 5) { // ( )님의 투두를 기다리는 중이에요
                        
                        // 이모티콘
                        Text("🍨")
                            .font(.system(size: 30))
                        
                        // contents
                        Text("\(todoInfo.title)")
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                            .fontWeight(.semibold)
                            .frame(width: 122)
                        
                        // time
                        HStack(spacing: 5) {
                            Text("🕒")
                            Text("\(String.convertToTime(todoInfo.deadline) ?? "미정")")
                        }
                        .font(.system(size: 10))
                        
                    } // VStack
                    .font(.system(size: 14))
                    .kerning(-1.05)
                    .padding(.leading, 18)
                    .foregroundStyle(Color.white)
                }
            }
        } // Button
        .padding(.bottom, 8)
//        .navigationDestination(isPresented: $isClicked) {
//            ToDoListUI()
//                .navigationBarBackButtonHidden()
////                .navigationTitle("To-Do List")
////                .toolbar {
////                    ToolbarItem(placement: .topBarTrailing) {
////                        Button {
////                            print("완료 버튼 클릭")
////                        } label: {
////                            Text("완료")
////                        }
////                    }
////                }
//        }
    }
}

struct TodoEmptyCell: View {
    @Binding var isClicked: Bool
    let memberNickname: String
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            Button {
                print("TDLPlusButton Clicked")
                isClicked.toggle()
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 122, height: 134)
                        .foregroundColor(Color.tdlDisabled)
                        .cornerRadius(20)
                        .padding(.leading, 18)
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.tdlGray)
                            .offset(x: 8, y: 0)
                        VStack { // ( )님의 투두를 기다리는 중이에요
                            HStack(spacing: 0) {
                                Text(memberNickname)
                                    .fontWeight(.semibold) +
                                Text("님의 투두를 기다리는 중이에요..😴")
                            }
                            .frame(width: 122)
                            .padding(5)
                            
                        } // VStack
                        .font(.system(size: 12))
                        .kerning(-1.05)
                        .padding(.leading, 18)
                        .foregroundStyle(Color.black)
                    }
                }
            } // Button
            .padding(.bottom, 8)
//            .navigationDestination(isPresented: $isClicked) {
//                ToDoListUI()
//                    .navigationBarBackButtonHidden()
////                    .navigationTitle("To-Do List")
////                    .toolbar {
////                        ToolbarItem(placement: .topBarTrailing) {
////                            Button {
////                                print("완료 버튼 클릭")
////                            } label: {
////                                Text("완료")
////                            }
////                        }
////                    }
//            }
        } // VStack
    }
}

//#Preview {
//    TodoSummaryListView(TDLList: ["1", "2"], memberInfo: Member())
//}
