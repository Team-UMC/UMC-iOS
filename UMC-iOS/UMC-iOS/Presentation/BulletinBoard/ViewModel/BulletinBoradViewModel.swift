//
//  BulletinBoradViewModel.swift
//  UMC-iOS
//BulletinBoradPreview
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI
import Foundation

class BulletinBoardViewModel: ObservableObject {
    @Published var boardPosts: [BoardPageResponse] = []

    // 게시판 목록 조회 메서드
    func fetchBoardPosts(completion: @escaping () -> Void) {
        Task {
            do {
                let posts = try await getBoardPosts()
                boardPosts = posts
                completion()
            } catch {
                print("게시판 포스트 가져오기 오류: \(error)")
            }
        }
    }

    // 게시판 목록 조회 비동기 메서드
    func getBoardPosts() async throws -> [BoardPageResponse] {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.boards.rawValue

        guard let url = urlComponents.url else {
            print("오류: URL을 생성할 수 없습니다.")
            throw ExchangeRateError.cannotCreateURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)

        if let response = response as? HTTPURLResponse, !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badResponse
        }

        do {
            let posts = try JSONDecoder().decode([BoardPageResponse].self, from: data)
            return posts
        } catch {
            print("JSON 디코딩 오류: \(error)")
            throw ExchangeRateError.decodeFailed
        }
    }
}
