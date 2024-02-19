//
//  ToDoLists.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/31.
//

import SwiftUI

struct ToDoLists: View {
    @ObservedObject var todoListViewModel: TodoListViewModel
    
    var body: some View {
        List {
            ForEach(todoListViewModel.todoList, id: \.id) { todo in
                ToDoListCell(viewModel: ToDoListCellViewModel(toDoTitle: todo.title, time: formattedDate(todo.deadline), todoIcon: "0"))
                    .listRowSeparator(.hidden)
                    .padding(.bottom, -15)
            }
        }
        .listStyle(PlainListStyle())
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            Task {
                await todoListViewModel.fetchGetTodoList()
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

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoLists(todoListViewModel: TodoListViewModel())
    }
}

