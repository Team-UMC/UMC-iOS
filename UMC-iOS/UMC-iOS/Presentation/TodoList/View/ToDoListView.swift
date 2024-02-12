//
//  ToDoListView.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/31.
//

import SwiftUI

struct ToDoList: View {
    @ObservedObject var todoListViewModel: TodoListViewModel
    @State private var contentData: [Int] = []

    var body: some View {
        List {
            ForEach(contentData, id: \.self) { index in
                ToDoListCell(viewModel: ToDoListCellViewModel(toDoTitle: "Sample Task", time: "12:00", todoIcon: "0"))
                .listRowSeparator(.hidden)
                .padding(.bottom, -15)
            }
        }
        .background(Color.clear)
        .listStyle(PlainListStyle())
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            addNewCell()
        }
        .onChange(of: contentData) { newValue in
            // Handle changes to contentData (e.g., when a new cell is added)
            print("Content Data Changed: \(newValue)")
        }
        .onAppear {
            Task {
                await todoListViewModel.fetchGetTodoList()
            }
        }
    }

    func addNewCell() {
        contentData.append(contentData.count + 1)
    }
}

#Preview {
    ToDoList(todoListViewModel: TodoListViewModel())
}

