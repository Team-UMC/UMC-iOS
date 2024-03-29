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
    static func fetchGetSpecificBoards(host: String, board: String, page: Int) async {
        do {
            let response = try await getSpecificBoards(host: host, board: board, page: page)
            print(response)
//            boards = Board(contentPreview: ContentPreView)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 특정 게시판의 게시글 목록 조회 API
    static func getSpecificBoards(host: String, board: String, page: Int) async throws -> BoardResponse.SpecificBoards {
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
    
    // 게시판 API - 게시글 검색 API(fetch)
    @MainActor
    static func fetchSearchBoards(keyword: String, page: Int) async {
        do {
            let response = try await searchBoards(keyword: keyword, page: page)
            print(response)
//            boards = Board(contentPreview: ContentPreView)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 게시글 검색 API
    static func searchBoards(keyword: String, page: Int) async throws -> BoardResponse.SearchBoards {
        //URL 생성
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards_search.rawValue
        urlComponents.queryItems = [
            URLQueryItem(name: "keyword", value: keyword),
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardResponse.SearchBoards>.self, from: data)
        
        var searchBoards: BoardResponse.SearchBoards
        searchBoards = jsonDictionary.result
        
        return searchBoards
    }
    
    // 게시판 API - 내가 쓴 게시글 조회/검색 API(fetch)
    @MainActor
    static func fetchGetMyBoards(keyword: String, page: Int) async {
        do {
            let response = try await getMyBoards(keyword: keyword, page: page)
            print(response)
//            boards = Board(contentPreview: ContentPreView)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 내가 쓴 게시글 조회/검색 API
    static func getMyBoards(keyword: String, page: Int) async throws -> BoardResponse.GetMyBoards {
        //URL 생성
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards_member_app.rawValue
        urlComponents.queryItems = [
            URLQueryItem(name: "keyword", value: keyword),
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardResponse.GetMyBoards>.self, from: data)
        
        var myBoards: BoardResponse.GetMyBoards
        myBoards = jsonDictionary.result
        
        return myBoards
    }
    
    // 게시판 API - 내가 좋아요한 게시글 조회/검색 API(fetch)
    @MainActor
    static func fetchGetMyHeartBoards(keyword: String, page: Int) async {
        do {
            let response = try await getMyHeartBoards(keyword: keyword, page: page)
            print(response)
//            boards = Board(contentPreview: ContentPreView)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 내가 좋아요한 게시글 조회/검색 API
    static func getMyHeartBoards(keyword: String, page: Int) async throws -> BoardResponse.GetMyHeartBoards {
        //URL 생성
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards_member_hearts_app.rawValue
        urlComponents.queryItems = [
            URLQueryItem(name: "keyword", value: keyword),
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardResponse.GetMyHeartBoards>.self, from: data)
        
        var myBoards: BoardResponse.GetMyHeartBoards
        myBoards = jsonDictionary.result
        
        return myBoards
    }
    
    // 게시판 API - 내가 댓글 쓴 글 조회/검색 API(fetch)
    @MainActor
    static func fetchGetMyCommentBoards(keyword: String, page: Int) async {
        do {
            let response = try await getMyCommentBoards(keyword: keyword, page: page)
            print(response)
//            boards = Board(contentPreview: ContentPreView)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 내가 댓글 쓴 글 조회/검색 API
    static func getMyCommentBoards(keyword: String, page: Int) async throws -> BoardResponse.GetMyCommentBoards {
        //URL 생성
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards_comments_member_comments_app.rawValue
        urlComponents.queryItems = [
            URLQueryItem(name: "keyword", value: keyword),
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardResponse.GetMyCommentBoards>.self, from: data)
        
        var myBoards: BoardResponse.GetMyCommentBoards
        myBoards = jsonDictionary.result
        
        return myBoards
    }
    
    // 운영진 게시판 API - 공지사항 목록 조회/검색 API(fetch)
    @MainActor
    static func fetchGetStaffNoticeBoards(host: String, keyword: String, page: Int) async {
        do {
            let response = try await getStaffNoticeBoards(host: host, keyword: keyword, page: page)
            print(response)
//            boards = Board(contentPreview: ContentPreView)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 운영진 게시판 API - 공지사항 목록 조회/검색 API
    static func getStaffNoticeBoards(host: String, keyword: String, page: Int) async throws -> BoardResponse.GetStaffNoticeBoards {
        //URL 생성
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.staff_boards_notices.rawValue
        urlComponents.queryItems = [
            URLQueryItem(name: "host", value: host),
            URLQueryItem(name: "keyword", value: keyword),
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardResponse.GetStaffNoticeBoards>.self, from: data)
        
        var staffNoticeBoards: BoardResponse.GetStaffNoticeBoards
        staffNoticeBoards = jsonDictionary.result
        
        return staffNoticeBoards
    }
    
    // POST
    
    // 게시판 API - 게시글 작성 API(fetch)
    @MainActor
    static func fetchCreateBoard(request: BoardRequest.CreateBoard, files: [FileInfo]) async {
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
    static func createBoard(sendData: Data, files: [FileInfo]) async throws -> BoardResponse.BoardId {
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
    static func fetchUpdateBoard(boardId: String, request: BoardRequest.UpdateBoard, files: [FileInfo]) async {
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
    static func updateBoard(boardId: String, sendData: Data, files: [FileInfo]) async throws -> BoardResponse.BoardId {
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
    
    // 게시판 댓글 API - 댓글 작성 API(fetch)
    @MainActor
    static func fetchCreateBoardComment(request: BoardCommentRequest.CreateBoardComment) async {
        do {
            print("fetchCreateBoardComment : \(request)")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            print(request)
            let sendData = try encoder.encode(request)
            if let jsonString = String(data: sendData, encoding: .utf8) {
                print("fetchCreateBoardComment : \(jsonString)")
            }
            print(request)
            
            let response = try await createBoardComment(sendData: sendData)
            print(response)

        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 댓글 API - 댓글 작성 API
    static func createBoardComment(sendData: Data) async throws -> BoardCommentResponse.BoardCommentId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards_comments.rawValue
        
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardCommentResponse.BoardCommentId>.self, from: data)
        
        var boardCommentId: BoardCommentResponse.BoardCommentId
        boardCommentId = jsonDictionary.result
        print(boardCommentId)
        
        return boardCommentId
    }
    
    // 게시판 댓글 API - 댓글 수정 API(fetch)
    @MainActor
    static func fetchUpdateBoardComment(commentId: String, request: BoardCommentRequest.UpdateBoardComment) async {
        do {
            print("fetchUpdateBoardComment : \(request)")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            print(request)
            let sendData = try encoder.encode(request)
            if let jsonString = String(data: sendData, encoding: .utf8) {
                print("fetchUpdateBoardComment : \(jsonString)")
            }
            print(request)
            
            let response = try await updateBoardComment(commentId: commentId, sendData: sendData)
            print(response)

        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 댓글 API - 댓글 수정 API
    static func updateBoardComment(commentId: String, sendData: Data) async throws -> BoardCommentResponse.BoardCommentId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards_comments.rawValue + "/\(commentId)"
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardCommentResponse.BoardCommentId>.self, from: data)
        
        var boardCommentId: BoardCommentResponse.BoardCommentId
        boardCommentId = jsonDictionary.result
        print(boardCommentId)
        
        return boardCommentId
    }
    
    // 게시판 댓글 API - 댓글 삭제 API(fetch)
    @MainActor
    static func fetchDeleteBoardComment(commentId: String) async {
        do {
            print("fetchDeleteBoardComment : \(commentId)")
            print(commentId)
            
            let commentId = try await deleteBoardComment(commentId: commentId)
            print(commentId)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 댓글 API - 댓글 삭제 API
    static func deleteBoardComment(commentId: String) async throws -> BoardCommentResponse.BoardCommentId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards_comments.rawValue + "/\(commentId)"
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardCommentResponse.BoardCommentId>.self, from: data)
        
        var boardCommentId: BoardCommentResponse.BoardCommentId
        boardCommentId = jsonDictionary.result
    
        
        return boardCommentId
    }
    
    // 게시판 API - 게시글 삭제 API(fetch)
    @MainActor
    static func fetchDeleteBoard(request: BoardRequest.BoardId) async {
        do {
            print("fetchDeleteBoard : \(request)")
            print(request)
            
            let boardId = try await deleteBoard(boardId: request.boardId)
            print(boardId)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 게시글 삭제 API
    static func deleteBoard(boardId: String) async throws -> BoardResponse.BoardId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards.rawValue + "/\(boardId)"
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
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
    
        
        return boardId
    }
    
    // 게시판 API - 게시글 좋아요/취소 API(fetch)
    @MainActor
    static func fetchHeartBoard(boardId: String) async {
        do {
            print("fetchHeartBoard : \(boardId)")
            print(boardId)
            
            let boardId = try await heartBoard(boardId: boardId)
            print(boardId)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 게시글 좋아요/취소 API
    static func heartBoard(boardId: String) async throws -> BoardResponse.BoardId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards.rawValue + "/\(boardId)" + ApiEndpoints.Path.heart.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
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
    
        
        return boardId
    }
    
    // 운영진 게시판 API - 교내 공지사항 핀 설정 API(fetch)
    @MainActor
    static func fetchPinnedBoard(boardId: String, isPinned: Bool) async {
        do {
            print("fetchPinnedBoard : \(boardId)")
            print(boardId)
            print("fetchPinnedBoard : \(isPinned)")
            print(isPinned)
            
            let boardId = try await pinnedBoard(boardId: boardId, isPinned: isPinned)
            print(boardId)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 운영진 게시판 API - 교내 공지사항 핀 설정 API(fetch)
    static func pinnedBoard(boardId: String, isPinned: Bool) async throws -> BoardResponse.BoardId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.staff_boards_notices.rawValue + "/\(boardId)" + ApiEndpoints.Path.pin.rawValue
        urlComponents.queryItems = [URLQueryItem(name: "isPinned", value: "\(isPinned)")]
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
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
    
        
        return boardId
    }
    
    // GET
    // 게시판 API - 게시글 특정 게시글 상세 조회 API(fetch)
    @MainActor
    static func fetchGetBoardDetail(boardId: String) async {
        do {
            print("fetchGetBoardDetail : \(boardId)")
            
            let response = try await getBoardDetail(boardId: boardId)
            print(response)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 게시글 특정 게시글 상세 조회 API
    static func getBoardDetail(boardId: String) async throws -> BoardResponse.GetBoardDetail {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards.rawValue + "/\(boardId)"
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardResponse.GetBoardDetail>.self, from: data)
        
        var boardDetail: BoardResponse.GetBoardDetail
        boardDetail = jsonDictionary.result
        print(boardDetail)
        
        return boardDetail
    }
    
    // 게시판 API - 핀 고정된 notice 조회 API(fetch)
    @MainActor
    static func fetchGetPinnedBoards() async -> BoardResponse.GetPinnedNotices {
        var pinnedNotices = BoardResponse.GetPinnedNotices()
        do {
            print("fetchGetPinnedBoards : ")
            
            pinnedNotices = try await getPinnedBoards()
            print(pinnedNotices)
        } catch {
            print("Error: \(error)")
        }
        return pinnedNotices
    }
    
    // 게시판 API - 핀 고정된 notice 조회 API
    static func getPinnedBoards() async throws -> BoardResponse.GetPinnedNotices {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards_pinned.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardResponse.GetPinnedNotices>.self, from: data)
        
        var pinnedNotices: BoardResponse.GetPinnedNotices
        pinnedNotices = jsonDictionary.result
        print(pinnedNotices)
        
        return pinnedNotices
    }
    
    // GET
    // 게시판 API - 게시글 특정 게시글 댓글 목록 조회 API(fetch)
    @MainActor
    static func fetchGetSpecificBoardComment(boardId: String, page: Int) async {
        do {
            print("fetchGetSpecificBoardComment : \(boardId)")
            
            let response = try await getSpecificBoardComment(boardId: boardId, page: page)
            print(response)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 API - 게시글 특정 게시글 상세 조회 API(fetch)
    static func getSpecificBoardComment(boardId: String, page: Int) async throws -> BoardCommentResponse.GetSpecificBoardComments {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards_comments.rawValue + "/\(boardId)"
        urlComponents.queryItems = [URLQueryItem(name: "page", value: "\(page)")]
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<BoardCommentResponse.GetSpecificBoardComments>.self, from: data)
        
        var comments: BoardCommentResponse.GetSpecificBoardComments
        comments = jsonDictionary.result
        print(comments)
        
        return comments
    }
}

extension BoardNetwork {

}
