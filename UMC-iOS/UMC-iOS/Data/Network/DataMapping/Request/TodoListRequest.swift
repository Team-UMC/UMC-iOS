//
//  TodoListRequest.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import Foundation

class TodoListRequest {
    struct CreateTodo: Codable {
        let title: String
        let deadline: String
    }
    
    struct DeleteTodo: Codable {
        let todoListId: String
    }
}
