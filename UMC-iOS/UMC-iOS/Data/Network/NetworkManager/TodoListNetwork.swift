//
//  TodoListNetwork.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/19/24.
//

import Foundation

class TodoListNetwork: ObservableObject {
    
    // TodoList API - 투두리스트 조회 API(fetch)
    @MainActor
    func fetchGetTodoList(date: String) async -> TodoListResponse.GetTodoList {
        var todoList = TodoListResponse.GetTodoList()
        do {
            todoList = try await getTodoList(date: date)
            print(todoList)
            
        } catch {
            print("Error: \(error)")
        }
        return todoList
    }
    
    // TodoList API - 투두리스트 조회 API
    func getTodoList(date: String) async throws -> TodoListResponse.GetTodoList {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.queryItems = [URLQueryItem(name: "date", value: date)]
        urlComponents.path = ApiEndpoints.Path.todoLists.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<TodoListResponse.GetTodoList>.self, from: data)
        
        var todoLists: TodoListResponse.GetTodoList
        todoLists = jsonDictionary.result
        
        return todoLists
    }
}
