//
//  Array+Extension.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import Foundation

extension Array where Element == TodoListResponse.TodoListInfo {
    func mapToToDoList() -> [TodoList] {
        return self.map { todoListInfo in
            let deadlineDate = Date.stringToDateTime(dateString: todoListInfo.deadline)
            return TodoList(id: todoListInfo.todoListId, member: nil, title: todoListInfo.title, deadline: deadlineDate, isCompleted: todoListInfo.completed)
        }
    }
}

