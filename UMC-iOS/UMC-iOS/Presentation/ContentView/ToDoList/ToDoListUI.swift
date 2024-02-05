//
//  ToDoListUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/31.
//

import SwiftUI

struct ToDoListUI: View {
    var body: some View {
        
        VStack{
            TodoDate()
                .padding(.leading,25)
                .padding(.bottom,-10)
                
            ToDoList()
            ToDoListAdd(viewModel: ToDoListCellViewModel(toDoTitle: "미리보기 할 일", time: "오후 2:00"))
            
            
            Image("Underbar")
                .padding(.bottom,-70)
            
            Spacer()
                
        }
        
    }
}

#Preview {
    ToDoListUI()
}

