//
//  ToDoListView.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/31.
//

import SwiftUI

struct ToDoListView: View {
    @State private var contentData: [Int] = Array(0..<5)
    @ObservedObject var todoListViewModel: TodoListViewModel
    var body: some View {
        List {
            ForEach(contentData, id: \.self) { todo in
                ToDoListCell(viewModel: ToDoListCellViewModel(toDoTitle: "Sample Task", time: "12:00", todoIcon: "🌕"))
                    .listRowSeparator(.hidden)
                    .padding(.bottom,-15)
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
    }


#Preview {
    ToDoListView(todoListViewModel: TodoListViewModel())
}


