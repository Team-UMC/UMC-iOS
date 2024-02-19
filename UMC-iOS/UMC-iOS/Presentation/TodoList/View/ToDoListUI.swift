//
//  ToDoListUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/31.
//

import SwiftUI

struct ToDoListUI: View {
    
    @State var title: String = ""
    @State var deadline: String = ""
    @State var todoIcon: String = ""
    
    var body: some View {
        
        VStack{
            
            ToDoListNavigationbar()
            
            TodoDate()
                .padding(.leading,25)
                .padding(.bottom,-10)
                
            ToDoLists(todoListViewModel: TodoListViewModel())
            ToDoListAdd(viewModel: ToDoListCellViewModel(toDoTitle: title, time: deadline, todoIcon: todoIcon))
            
            
            Image("Underbar")
                .padding(.bottom,-70)
            
            Spacer()
                
        }
        
    }
}

#Preview {
    ToDoListUI()
}


