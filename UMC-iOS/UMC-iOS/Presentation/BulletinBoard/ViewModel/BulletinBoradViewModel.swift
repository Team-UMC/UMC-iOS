//
//  BulletinBoradViewModel.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/06.
//

import Foundation
import Combine

class UserContentPreListViewModel: ObservableObject {
    
    @Published var member = Member()
    @Published var boards = Boards()
    
}

extension UserContentPreListViewModel{
    // API
    // GET
    // 글 조회 API - 글 조회 조회 API(fetch)
    // 게시글 조회용
    @MainActor
    func fetchGetContentPreView() async {
        do {
            let ContentPreView = try await getContentPreView()
            print(ContentPreView)
            boards = Boards(contentPreview: ContentPreView)
        } catch {
            print("Error: \(error)")
        }
    }
}
func getContentPreView() async throws -> BoardCellResponse.BoardPageInfo {
    //URL 생성
    var urlComponents = ApiEndpoints.getBasicUrlComponents()
    urlComponents.path = ApiEndpoints.Path.members.rawValue

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
        throw ExchangeRateError.badResponse
    }
    
    let decoder = JSONDecoder()
    
    let jsonDictionary = try decoder.decode(BaseResponse<BoardCellResponse.BoardPageInfo>.self, from: data)
    
    var contentPreView: BoardCellResponse.BoardPageInfo
    contentPreView = jsonDictionary.result
    
    return contentPreView
}
