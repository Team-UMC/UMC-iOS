//
//  ToDoListAdd.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/30.
//

import SwiftUI

struct ToDoListAdd: View {
    
    @ObservedObject var viewModel = TodoListViewModel()
    @ObservedObject var todoListNetwork = TodoListNetwork()
    
    // 추후 삭제.
    @ObservedObject private var cellViewModel = ToDoListCellViewModel(toDoTitle: "", time: "", todoIcon: "")
    

    @State var title: String = ""
    @State var todoicon: String = ""
    @Binding var todoList: TodoListResponse.GetTodoList
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("#F0F4FF"))
                .frame(width:340, height: 46)
                .cornerRadius(12)
            
            HStack{
                ZStack{
                    Rectangle()
                        .fill(.white)
                        .frame(width:30, height: 30)
                        .cornerRadius(6)
                        .padding(.leading,24)
                        .overlay(
                            TextField("🌕",text:$todoicon)
                                .padding(.leading,27)
                        )
                }
                
                TextField("할일을 입력해주세요.",text: $title)
                    .foregroundColor(Color("textColor"))
                    .font(.system(size: 12))
                    .padding(.leading,10)
                    .frame(width:220)
                
                Button(action: {
                    Task {
                        // 추후 deadline 수정
                        await viewModel.fetchCreateTodoList(todoInfo: TodoListRequest.CreateTodo(title: title, deadline: "2024-02-20T23:59:59"))
                        print("todoList(befroe) : \(todoList)")
                        todoList = await todoListNetwork.fetchGetTodoList(date: String.currentLocalDateToString())
                        print("todoList(after) : \(todoList)")
                        
                    }
                    print("추가버튼을 눌렀습니다")
                }) {
                    Text("추가")
                        .font(.system(size: 12))
                        .bold()
                        .frame(width: 48,height: 30)
                        .foregroundColor(Color("searchPurple"))
                        .background(.white)
                        .cornerRadius(12)
                    
                }
                .padding(.leading,-10)
                
                Spacer()
            }
            .padding()
            
            
            
        }
        
        
    }
}

//struct ToDoListAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDoListAdd(viewModel: ToDoListCellViewModel(toDoTitle: "미리보기 할 일", time: "오후 2:00", todoIcon: "🌕"))
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}

