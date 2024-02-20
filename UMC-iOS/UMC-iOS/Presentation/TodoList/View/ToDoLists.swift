//
//  ToDoLists.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/31.
//

import SwiftUI

struct ToDoLists: View {
//    @ObservedObject var todoListViewModel: TodoListViewModel
    @ObservedObject var todoListNetwork = TodoListNetwork()
    
    @Binding var todoList: TodoListResponse.GetTodoList
    
    var body: some View {
        List {
            ForEach(todoList.todoLists, id: \.self) { todo in
                ToDoListCell(todo: todo)
                    .listRowSeparator(.hidden)
                    .padding(.bottom, -15)
            }
        }
        .listStyle(PlainListStyle())
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            Task {
                todoList = await todoListNetwork.fetchGetTodoList(date: String.currentLocalDateToString())
            }
        }
    }
    
    // Format Date to String
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" 
        return formatter.string(from: date)
    }
}
//
//struct ToDoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDoLists(todoListViewModel: TodoListViewModel())
//    }
//}

