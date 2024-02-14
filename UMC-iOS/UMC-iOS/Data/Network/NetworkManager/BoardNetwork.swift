//
//  BoardNetwork.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import Foundation


class BoardNetwork: ObservableObject {
    
    // API
    
    // GET
    // 게시판 API - 특정 게시판의 게시글 목록 조회 API(fetch)
    @MainActor
    func fetchGetSpecificBoards(host: String, board: String, page: Int) async {
        do {
            let response = try await getSpecificBoards(host: host, board: board, page: page)
            print(response)
//            boards = Board(contentPreview: ContentPreView)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 특정 게시판의 게시글 목록 조회 API
    func getSpecificBoards(host: String, board: String, page: Int) async throws -> BoardResponse.SpecificBoards {
        //URL 생성
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards.rawValue
        urlComponents.queryItems = [
            URLQueryItem(name: "host", value: host),
            URLQueryItem(name: "board", value: board),
            URLQueryItem(name: "page", value: "\(page)"),
        ]

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
           !(200...299).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }


        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardResponse.SpecificBoards>.self, from: data)
        
        var specificBoards: BoardResponse.SpecificBoards
        specificBoards = jsonDictionary.result
        
        return specificBoards
    }
    
    // POST
    
    // 게시판 API - 게시글 작성 API(fetch)
    @MainActor
    func fetchCreateBoard(request: BoardRequest.CreateBoard, files: [FileInfo]) async {
        do {
            print("fetchCreateBoard : \(request)")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            print(request)
            let sendData = try encoder.encode(request)
            if let jsonString = String(data: sendData, encoding: .utf8) {
                print("fetchCreateTodoList : \(jsonString)")
            }
            print(request)
            
            let response = try await createBoard(sendData: sendData, files: files)
            print(response)

        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 게시글 작성 API
    func createBoard(sendData: Data, files: [FileInfo]) async throws -> BoardResponse.BoardId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        var body = Data()
        
        // Multipart 데이터 추가
        for file in files {
            let fileData = Data.createFileData(boundary: boundary, data: file.data, mimeType: file.mimeType, fileName: file.fileName)
            body.append(fileData)
        }

        // JSON 데이터 추가
        let jsonData = Data.createJsonStringData(boundary: boundary, data: sendData)
        body.append(jsonData)
        body.append("--".appending(boundary.appending("--")).data(using: .utf8)!)
        
        request.httpBody = body
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardResponse.BoardId>.self, from: data)
        
        var boardId: BoardResponse.BoardId
        boardId = jsonDictionary.result
        print(boardId)
        
        return boardId
    }
    
    // 게시판 API - 게시글 수정 API(fetch)
    @MainActor
    func fetchUpdateBoard(boardId: String, request: BoardRequest.UpdateBoard, files: [FileInfo]) async {
        do {
            print("fetchUpdateBoard : \(request)")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            print(request)
            let sendData = try encoder.encode(request)
            if let jsonString = String(data: sendData, encoding: .utf8) {
                print("fetchUpdateBoard : \(jsonString)")
            }
            print(request)
            
            let response = try await updateBoard(boardId: boardId,sendData: sendData, files: files)
            print(response)

        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 게시글 수정 API
    func updateBoard(boardId: String, sendData: Data, files: [FileInfo]) async throws -> BoardResponse.BoardId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards.rawValue + "/\(boardId)"
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        var body = Data()
        
        // Multipart 데이터 추가
        for file in files {
            let fileData = Data.createFileData(boundary: boundary, data: file.data, mimeType: file.mimeType, fileName: file.fileName)
            body.append(fileData)
        }

        // JSON 데이터 추가
        let jsonData = Data.createJsonStringData(boundary: boundary, data: sendData)
        body.append(jsonData)
        body.append("--".appending(boundary.appending("--")).data(using: .utf8)!)
        
        request.httpBody = body
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardResponse.BoardId>.self, from: data)
        
        var boardId: BoardResponse.BoardId
        boardId = jsonDictionary.result
        print(boardId)
        
        return boardId
    }
}

extension BoardNetwork {
    struct FileInfo {
        var data: Data
        var fileName: String
        var mimeType: String
    }
}
