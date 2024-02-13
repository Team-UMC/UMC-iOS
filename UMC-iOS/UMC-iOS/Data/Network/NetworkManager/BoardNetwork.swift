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
}
