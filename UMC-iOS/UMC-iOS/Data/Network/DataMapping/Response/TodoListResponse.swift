//
//  TodoListResponse.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import Foundation

struct TodoListResponse: Codable {
    struct TodoListInfo: Codable {
        var id: String? = ""
        var todoListId: String = ""
        var title: String = ""
        var deadline: String = ""
        var completed: Bool = false
    }
    
    struct GetTodoList: Codable {
        var todoLists: [TodoListInfo] = []
    }
    
    struct TodoListId: Codable {
        var todoListId: String = ""
    }
    
    struct CompleteTodo: Codable {
        var todoListId: String = ""
        var pointAcquired: Bool = false
    }
}
