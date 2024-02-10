//
//  TodoList.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import Foundation

struct TodoList {
    typealias Identifier = String
    var id: Identifier = ""
    var member: Member?
    var title: String
    var deadline: Date
    var isCompleted: Bool
}

extension TodoList {
    // Mapper
    init(todoInfo: TodoListResponse.TodoListInfo) {
        self.id = todoInfo.todoListId
        self.member = Member()
        self.title = todoInfo.title
        self.deadline = Date.stringToDateTime(dateString: todoInfo.deadline)
        self.isCompleted = todoInfo.completed
    }
}
