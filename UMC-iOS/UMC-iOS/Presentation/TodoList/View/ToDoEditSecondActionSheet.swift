//
//  ToDoEditSecondActionSheet.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/31.
//

import SwiftUI

struct ToDoEditSecondActionSheet: View {
    @ObservedObject var viewModel = TodoListViewModel()
    @ObservedObject private var cellViewModel: ToDoListCellViewModel
    
    @State private var editActionSheetVisible = false
    @StateObject private var toDoListCellViewModel = ToDoListCellViewModel(toDoTitle: "Sample Task", time: "12:00", todoIcon: "🌕")
    
    init(viewModel: ToDoListCellViewModel) {
            self._cellViewModel = ObservedObject(wrappedValue: viewModel)
        }
    
    @State private var title: String = ""
    @State private var todoListId: String = ""
    
    var body: some View {
        ZStack{
            ToDoEditSheet()
            VStack{
                
                //텍스트
                Text("⏰시간에 맞춰 알림을 보내드릴게요!")
                    .font(.system(size: 12))
                    .foregroundColor(Color("textColor"))
                    .padding(.bottom,16)
                
                HStack{
                    VStack{
                        //오전
                        Button(action: {
                            
                        }) {
                            Text("오전")
                                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                                .background(.white)
                                .foregroundColor(Color("#999999"))
                                .font(.system(size:12))
                                .bold()
                                .cornerRadius(12)
                        }
                        .padding(.bottom,-4)
                        
                        //오후
                        Button(action: {
                            
                        }) {
                            Text("오후")
                                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                                .background(.white)
                                .foregroundColor(Color("#999999"))
                                .font(.system(size:12))
                                .bold()
                                .cornerRadius(12)
                        }
                        
                    }
                    .padding(.trailing,20)
                    
                    TextField("00", text: $toDoListCellViewModel.hour)
                        .padding(EdgeInsets(top:11, leading: 13.5, bottom: 11, trailing: 13.5))
                        .frame(width: 44,height: 44)
                        .background(.white)
                        .foregroundColor(Color("#999999"))
                        .font(.system(size:12))
                        .bold()
                        .cornerRadius(12)
                    
                    Text("시")
                        .font(.system(size:14))
                        .foregroundColor(.black)
                        .bold()
                        .padding(.trailing,20)
                    
                    TextField("00", text: $toDoListCellViewModel.minute)
                        .padding(EdgeInsets(top:11, leading: 13.5, bottom: 11, trailing: 13.5))
                        .frame(width: 44,height: 44)
                        .background(.white)
                        .foregroundColor(Color("#999999"))
                        .font(.system(size:12))
                        .bold()
                        .cornerRadius(12)
                    
                    Text("분")
                        .font(.system(size:14))
                        .foregroundColor(.black)
                        .bold()

                }
                HStack{
                    Button(action: {
                        Task {
                            await viewModel.fetchDeleteTodoList(todoListId: TodoListRequest.DeleteTodo(todoListId: todoListId))
                        }
                    }) {
                        Text("삭제")
                            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                            .background(Color("#FFD1D1"))
                            .foregroundColor(Color("#852121"))
                            .font(.system(size:12))
                            .bold()
                            .cornerRadius(12)
                    }
                    .padding(.trailing,12)
                    
                    Button(action: {
                        editActionSheetVisible.toggle()
                        Task {
                            await viewModel.fetchUpdateTodoList(todoListId: todoListId, todoInfo: TodoListRequest.UpdateTodo(title: title, deadline: "2024-02-10T14:35:03"))
                        }
                    }) {
                        Text("완료")
                            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                            .background(Color("#9BCFFF"))
                            .foregroundColor(Color("#404572"))
                            .font(.system(size:12))
                            .bold()
                            .cornerRadius(12)
                    }
                    .sheet(isPresented: $editActionSheetVisible) {
                        ToDoEditSecondActionSheet(viewModel: ToDoListCellViewModel(toDoTitle: "미리보기 할 일", time: "오후 2:00", todoIcon: "🌕"))
                    }
                }
            }
        }
    }
}

//cellViewModel

