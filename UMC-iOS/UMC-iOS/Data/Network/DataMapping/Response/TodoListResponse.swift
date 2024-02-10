//
//  TodoListResponse.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import Foundation

struct TodoListResponse: Codable {
    struct TodoListInfo: Codable {
        let id: String?
        let todoListId: String
        let title: String
        let deadline: String
        let completed: Bool
    }
    
    struct GetTodoList: Codable {
        let todoLists: [TodoListInfo]
    }
    
    struct TodoListId: Codable {
        let todoListId: String
    }
    
    struct CompleteTodo: Codable {
        let todoListId: String
        let pointAcquired: Bool
    }
}
