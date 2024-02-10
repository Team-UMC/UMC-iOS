//
//  TodoListViewModel.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todoList: [TodoList] = []

    func addNewCell(title: String, time: String, todoIcon: String) {
//        let newTodo = T
//        let newCellViewModel = ToDoListCellViewModel(toDoTitle: title, time: time, todoIcon: todoIcon)
//        todoList.append(newCellViewModel)
    }
}


extension TodoListViewModel {
    
    // TodoList API - 투두리스트 조회 API(fetch)
    @MainActor
    func fetchGetTodoList() async {
        do {
            let todoList = try await getTodoList()
            print(todoList)
            self.todoList = todoList.todoLists.mapToToDoList()
        } catch {
            print("Error: \(error)")
        }
    }
    
    // TodoList API - 투두리스트 조회 API
    func getTodoList() async throws -> TodoListResponse.GetTodoList {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.queryItems = [URLQueryItem(name: "date", value: String.currentLocalDateToString())]
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
    
    // POST
    
    // TodoList API - 투두리스트 작성 API(fetch)
    @MainActor
    func fetchCreateTodoList(todoInfo: TodoListRequest.CreateTodo) async {
        do {
            print("fetchCreateTodoList : \(todoInfo)")
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            print(todoInfo)
            let sendData = try encoder.encode(todoInfo)
            if let jsonString = String(data: sendData, encoding: .utf8) {
                print("fetchCreateTodoList : \(jsonString)")
            }
            
            let todoListId = try await createTodoList(sendData: sendData)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // TodoList API - 투두리스트 작성 API
    func createTodoList(sendData: Data) async throws -> TodoListResponse.TodoListId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.todoLists.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        request.httpBody = sendData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<TodoListResponse.TodoListId>.self, from: data)
        
        var todoListId: TodoListResponse.TodoListId
        todoListId = jsonDictionary.result
        print(todoListId)
        
        return todoListId
    }
    
    // DELETE
    
    // TodoList API - 투두리스트 삭제 API(fetch)
    @MainActor
    func fetchDeleteTodoList(todoListId: TodoListRequest.DeleteTodo) async {
        do {
            print("fetchDeleteTodoList : \(todoListId)")
            let todoListId = try await deleteTodoList(todoListId: todoListId.todoListId)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // TodoList API - 투두리스트 삭제 API
    func deleteTodoList(todoListId: String) async throws -> TodoListResponse.TodoListId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.todoLists.rawValue
        urlComponents.queryItems = [URLQueryItem(name: "todoListId", value: todoListId)]
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<TodoListResponse.TodoListId>.self, from: data)
        
        var todoListId: TodoListResponse.TodoListId
        todoListId = jsonDictionary.result
        print(todoListId)
        
        return todoListId
    }
}
